import "package:get/get.dart";
import "package:lg_tribe_client/lg_tribe_client.dart";
import "package:serverpod_flutter/serverpod_flutter.dart";
import "package:lg_tribe/login/registration/user_registration.dart";


class RegistrationController extends GetxController {
  // Define the form fields
  var firstName = ''.obs;
  var lastName = ''.obs;
  var contacts = ''.obs;
  var email = ''.obs;
  var password = ''.obs;

  @override
  void onInit()
  {
    super.onInit();

    var client = Client('http://localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();
  }
  // Method to register a user
  Future<void> _registerUser() async {
    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final email = emailController.text;
    final contactNumber = int.tryParse(contactNumberController.text);
    final password = passwordController.text;

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        contactNumber == null ||
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
        authenticationlevel as AuthenticationLevel,
        country as Country,
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
      print('Error: $e');
    }
  }

}