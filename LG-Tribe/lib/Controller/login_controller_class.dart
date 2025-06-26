import "package:get/get.dart";
import "package:lg_tribe_client/lg_tribe_client.dart";
import "package:serverpod_flutter/serverpod_flutter.dart";
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController
{
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
    client = Client('http://localhost:8080/')..connectivityMonitor = FlutterConnectivityMonitor();
  }

  Future<void> loginUser({
    required int contacts,
    required String password,
    required AuthenticationLevel authLevel,
    required Country country,
    bool autoLogin = false,
  }) async
  {
    if(password.isEmpty || contacts.toString().length < 10 || contacts.toString().length > 10) {
      Get.snackbar(
        "Error",
        "Please fill in all the fields!",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try
    {
      final result = await client.userEndpoints.loginUser(
        contacts,
        password,
        authLevel,
        country,
      );

      if(result == true)
      {
        //Login Successful
      }
    }
  }

  Future<void> logout() async {
    loggedInUser.value = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  bool get isLoggedIn => loggedInUser.value != null;
}