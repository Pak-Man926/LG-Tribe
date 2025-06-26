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
    if(contacts.toString().length < 10 || password.isEmpty)
    {
      Get.snackbar(
        "Error",
        "Please fill in all the form fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      //errorMessage.value = "Please enter valid credentials";
      return;
    }
  }

  Future<void> logout() async {
    loggedInUser.value = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  bool get isLoggedIn => loggedInUser.value != null;
}