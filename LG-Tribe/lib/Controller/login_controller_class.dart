import "package:get/get.dart";
import "package:lg_tribe_client/lg_tribe_client.dart";
import "package:serverpod_flutter/serverpod_flutter.dart";
import 'package:shared_preferences/shared_preferences.dart';
import "package:lg_tribe/Controller/storage_service.dart";

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
    client = Client("http://$localhost:8080/")
      ..connectivityMonitor = FlutterConnectivityMonitor();
    // Load stored login data if available
    loadStoredLoginData();
  }

  // Load stored login data from SharedPreferences
  Future<void> loadStoredLoginData() async 
  {
    final data = await StorageService.getLoginData();

    if(data['contacts'] != null && data['password'] != null) 
    {
      phoneNumber.value = data['contacts'].toString();
      password.value = data['password'] ?? '';
      // Optionally, you can also set the auth level and country if needed
      Get.offAllNamed("/homepage");
    }
    else
    {
      // If no stored data, redirect to login page
      Get.offAllNamed("/userlogin");
    }
  }

  //Metod to login a user
  Future<void> loginUser({
    required int contactNumber,
    required String password,
    required AuthenticationLevel authenticationLevel,
    required Country country,
    //bool autoLogin = false,
  }) async {
    // Set loading state to true
    isLoading.value = true;
    //Checks if all fields are filled
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

        loggedInUser.value = User(
          firstName: firstName,
          lastName: lastName,
          contacts: contactNumber,
          email: email,
          password: password,
          authLevel: authenticationLevel,
          country: country,
        );
        //Login Successful
        await StorageService.saveLoginData(
          contacts: contactNumber,
          authLevel: authenticationLevel.toString(),
          country: country.toString(),
          password: password,
        );

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

  Future<void> logout() async {
    loggedInUser.value = null;
    await StorageService.clearLoginData();

    Get.snackbar(
      "Thank you!",
      "GoodBye!",
      snackPosition: SnackPosition.BOTTOM);

    Get.offAllNamed("/userlogin");
  }

  
  bool get isLoggedIn => loggedInUser.value != null;
}
