import "package:lg_tribe_server/src/endpoints/user_endpoints.dart";
import "package:serverpod/serverpod.dart";
import "package:lg_tribe_server/src/generated/user_models.dart";


class ProfileInfoEndpoints extends Endpoint
{
  Future<bool> getProfileInfo(Session session) async {

    // Fetch the user profile from the database
    final userProfile = await User.findBycontacts(session, session.user!.contacts);

    if (userProfile == null) {
      return false; // User not found
    }

    // Return the user profile data
    return userProfile;
  }
    
}