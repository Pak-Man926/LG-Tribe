import "dart:async";
import "package:serverpod/serverpod.dart";
import "package:lg_tribe_server/src/generated/user_models.dart";
import "package:lg_tribe_server/src/generated/auth_level.dart";
import "package:lg_tribe_server/src/generated/country.dart";
import "package:bcrypt/bcrypt.dart";

class UserEndpoints extends Endpoint {
  Future<bool> registerUser(
      Session session,
      String firstName,
      String lastName,
      int contacts,
      String email,
      String password,
      AuthenticationLevel authenticationlevel,
      Country country) async {
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
        firstName: firstName,
        lastName: lastName,
        contacts: contacts,
        email: email,
        password: hashedPassword,
        authlevel: authenticationlevel,
        country: country);

    await User.db.insertRow(session, user);

    return true;
  }

  Future<bool> loginUser(
    Session session,
    int contacts,
    String password,
    AuthenticationLevel authenticationlevel,
    Country country,
  ) async {
    
    final bool checkPassword = BCrypt.checkpw(password, hashed);

    // Step 1: Find the user by contacts and password
    var registeredUser = await User.db.findFirstRow(
      session,
      where: (t) => t.contacts.equals(contacts) & t.password.equals(password),
    );

  

    // Step 2: Check password with bcrypt
    if (registeredUser == null || checkPassword == false)
    //registeredUser.password != password)
    {
      return false; // Invalid credentials
    }

    // Step 3: Continue with further validation
    if (registeredUser.authlevel != authenticationlevel || registeredUser.country != country) 
    {
      return false; // Additional validation failed
    }

    return true; // All checks passed
  }
}
