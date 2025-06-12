import "dart:async";
import "package:serverpod/serverpod.dart";
import "package:lg_tribe_server/src/generated/user_models.dart";
import "package:bcrypt/bcrypt.dart";

class UserEndpoints extends Endpoint 
{
  Future<bool> registerUser(Session session, String firstName, String lastName, int contacts, String email, String password, AuthLevel authlevel, Country country) async
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
    );

    await User.db.insertRow(session, user);

    return true;
  }

  Future<User?> loginUser(Session session, int contacts, String password) async
  {
    if (password.isEmpty) {
      return null; // Invalid credentials
    }

    if(!BCrypt.checkpw(password, password))
    {
      return null; // Invalid credentials
    }
    
    // Find the user with the given contacts and password
    var user = await User.db.findFirstRow(
      session,
      where: (t) => t.contacts.equals(contacts) & t.password.equals(password),
    );

    if (user == null) {
      return null; // Invalid credentials
    }

    return user; // Return the found user
  }
  
}
