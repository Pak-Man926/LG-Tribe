import "package:get/get.dart";
import "package:lg_tribe_client/lg_tribe_client.dart";
import "package:serverpod_flutter/serverpod_flutter.dart";
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  // Form fields for login
  var phoneNumber = " ".obs;
  var password = " ".obs;
  var isLoading = false.obs;
  var loggedInUser = Rxn<User>();
  var errorMessage = " ".obs;
  var registrationSuccess = false.obs;

  late final Client client;

  @override
  void onInit() {
    super.onInit();
    client = Client('http://localhost:8080/')
      ..connectivityMonitor = FlutterConnectivityMonitor();
  }

  //Metod to login a user
  Future<void> loginUser({
    required int contactNumber,
    required String password,
    required AuthenticationLevel authenticationLevel,
    required Country country,
    //bool autoLogin = false,
  }) async {
    final storedPrefs = await SharedPreferences.getInstance();
    final storedContactNumber = storedPrefs.getInt('contacts');
    final storedPassword = storedPrefs.getString('password');
    final storedAuthLevel = storedPrefs.getString('authLevel');
    final storedCountry = storedPrefs.getString('country');

    if(storedContactNumber != null || storedPassword != null || storedAuthLevel != null || storedCountry != null) 
    {
      // If user is already logged in, redirect to homepage
      Get.offAllNamed("/homepage");
      return;
    }
    else{
      if (password.isEmpty || contactNumber.toString().isEmpty) 
    {
      // Show error message if any field is empty
      Get.snackbar(
        "Error",
        "Please fill in all the fields!",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      final result = await client.userEndpoints.loginUser(
        contactNumber,
        password,
        authenticationLevel,
        country,
      );

      if (result == true) {
        //Login Successful
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('contacts', contactNumber);
        await prefs.setString('password', password);
        await prefs.setString('authLevel', authenticationLevel.name);
        await prefs.setString('country', country.name);

        Get.snackbar(
          "Login Successful",
           "Welcome back!",
          snackPosition: SnackPosition.BOTTOM,
        );

        //Redirect to the homepage
        Get.offAllNamed("/homepage");
      } else {
        // Login failed

        Get.snackbar(
          "Error",
          "Invalid Credentials",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('Error during login: $e');

      Get.snackbar(
        "Error",
        "An error occurred during login",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    }

    
  }

  Future<void> logout() async {
    loggedInUser.value = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Get.snackbar(
      "Thank you!",
      "GoodBye!",
      snackPosition: SnackPosition.BOTTOM);

    Get.offAllNamed("/userlogin");
  }

  
  bool get isLoggedIn => loggedInUser.value != null;
}
