import "package:get/get.dart";
import "package:lg_tribe_client/lg_tribe_client.dart";
import "package:serverpod_flutter/serverpod_flutter.dart";
//import "package:lg_tribe/login/registration/user_registration.dart";

late final Client client;
class RegistrationController extends GetxController {
  // Client instance for making API calls
  // This will be initialized in the onInit method  
  @override
  void onInit()
  {
    super.onInit();

    client = Client("http://$localhost:8080/")
    ..connectivityMonitor = FlutterConnectivityMonitor();
  }
  // Method to register a user
  Future<void> registerUser({
    required String firstName,
    required String lastName,
    required int contactNumber,
    required String email,
    required String password,
    required AuthenticationLevel authenticationlevel,
    required Country country,
  }) async {

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        contactNumber.toString().isEmpty ||
        password.isEmpty) {
      //Show error message if any field is empty
      Get.snackbar(
        "Error",
        "Please fill in all fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      final result = await client.userEndpoints.registerUser(
        firstName,
        lastName,
        contactNumber,
        email,
        password,
        authenticationlevel,
        country,
      );

      if (result == true) {
        // Registration successful
        //print('User registered successfully');

        Get.snackbar(
          "Success",
          "User registered successfully",
          snackPosition: SnackPosition.BOTTOM,
        );

        // Navigate to the login page
        Get.offAllNamed(
          "/userlogin",
        ); // Clear all previous routes and navigate to the login page
      } else {
        // Registration failed
        //print("User registration failed!")
        Get.snackbar(
          "Error",
          "User registration failed",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      // Handle error
      print('Error during registration: $e');
      Get.snackbar(
        "Error",
        "An error occurred during registration",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

}