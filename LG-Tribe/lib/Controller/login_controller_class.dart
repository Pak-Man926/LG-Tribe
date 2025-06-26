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

  late Client client;

  @override
  void onInit() {
    super.onInit();
    client = Client('http://localhost:8080/')
      ..connectivityMonitor = FlutterConnectivityMonitor();
  }

  Future<void> loginUser({
    required int contacts,
    required String password,
    required AuthenticationLevel authLevel,
    required Country country,
    //bool autoLogin = false,
  }) async {
    if (password.isEmpty || contacts.toString().isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill in all the fields!",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      final result = await client.userEndpoints.loginUser(
        contacts,
        password,
        authLevel,
        country,
      );

      if (result == true) {
        //Login Successful
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('contacts', contacts);
        await prefs.setString('password', password);
        await prefs.setString('authLevel', authLevel.name);
        await prefs.setString('country', country.name);

        GetSnackBar(
          title: "Login Successful",
          message: "Welcome back!",
          snackPosition: SnackPosition.BOTTOM,
        ).show();

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
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  bool get isLoggedIn => loggedInUser.value != null;
}
