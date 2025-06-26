import "dart:async";
import "package:serverpod/serverpod.dart";
import "package:lg_tribe_server/src/generated/user_models.dart";
import "package:lg_tribe_server/src/generated/auth_level.dart";
import "package:lg_tribe_server/src/generated/country.dart";
import "package:bcrypt/bcrypt.dart";

class UserEndpoints extends Endpoint 
{
  Future<bool> registerUser(Session session, String firstName, String lastName, int contacts, String email, String password, AuthenticationLevel authenticationlevel, Country country) async
  {
    var existingUser = await User.db.findFirstRow(
      session,
      where: (t) => t.contacts.equals(contacts),
    );

    if (existingUser != null) {
      return false; // User already exists
    }
    // Create a new user

    final hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

    final user = User(
      firstName:firstName,
      lastName: lastName,
      contacts: contacts,
      email: email,
      password: hashedPassword, 
      authlevel: authenticationlevel,
      country: country
    );

    await User.db.insertRow(session, user);

    return true;
  }

  Future<User?> loginUser(Session session, int contacts, String password, AuthenticationLevel authenticationlevel, Country country) async
  {
    if (password.isEmpty || contacts.toString().isEmpty || contacts.toString().length < 10){
      return null; // Invalid credentials
    }

    // if(user == null || !BCrypt.checkpw(password, user.password))
    // {
    //   return null; // Invalid credentials
    // }
    
    // Find the user with the given contacts and password
    var user = await User.db.findFirstRow(
      session,
      where: (t) => t.contacts.equals(contacts) & t.password.equals(password) &
                   t.authlevel.equals(authenticationlevel) &
                   t.country.equals(country),
    );

    if (user == null || !BCrypt.checkpw(password, user.password)) 
    {
      return null; // Invalid credentials
    }

    return user; // Return the found user
  }
  
}
