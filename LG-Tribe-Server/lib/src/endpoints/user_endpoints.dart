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
    // Step 1: Find user by contacts only
    var registeredUser = await User.db.findFirstRow(
      session,
      where: (t) => t.contacts.equals(contacts),
    );

    // Step 2: Check if user exists
    if (registeredUser == null) {
      return false;
    }

    // Step 3: Validate password with bcrypt
    final bool checkPassword =
        BCrypt.checkpw(password, registeredUser.password);

    if (!checkPassword) {
      return false;
    }

    // Step 4: Additional checks
    if (registeredUser.authlevel != authenticationlevel ||
        registeredUser.country != country) {
      return false;
    }

    return true;
  }

  Future<User?> getUserProfile(Session session, int contacts) async {
    // Fetch the user profile from the database
    final userProfile = await User.db.findFirstRow(session, 
    where: (t) => t.contacts.equals(contacts));

    if (userProfile == null) {
      return null; // User not found
    }

    // Return the user profile data
    return userProfile;
  }
}
