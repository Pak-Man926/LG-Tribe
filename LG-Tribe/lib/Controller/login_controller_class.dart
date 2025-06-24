import "package:get/get.dart";

class LoginController extends GetxController
{
  // Form fields for login
  var phoneNumber = " ".obs;
  var password = " ".obs;

  late Client client;

  @override
  void onInit() {
    super.onInit();
    client = Client('http://localhost:8080/')..connectivityMonitor = FlutterConnectivityMonitor();
    _loadSavedLogin(); // try auto-login
  }

  Future<void> _loadSavedLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final contacts = prefs.getInt('contacts');
    final password = prefs.getString('password');
    final authLevelName = prefs.getString('authLevel');
    final countryName = prefs.getString('country');

    if (contacts != null && password != null && authLevelName != null && countryName != null) {
      loginUser(
        contacts: contacts,
        password: password,
        authLevel: AuthenticationLevel.values.byName(authLevelName),
        country: Country.values.byName(countryName),
        autoLogin: true,
      );
    }
  }

  Future<void> loginUser({
    required int contacts,
    required String password,
    required AuthenticationLevel authLevel,
    required Country country,
    bool autoLogin = false,
  }) async {
    if (!autoLogin) isLoading.value = true;

    try {
      User? user = await client.user.loginUser(contacts, password, authLevel, country);
      if (user != null) {
        loggedInUser.value = user;

        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('contacts', contacts);
        await prefs.setString('password', password);
        await prefs.setString('authLevel', authLevel.name);
        await prefs.setString('country', country.name);

        if (!autoLogin) {
          Get.snackbar('Login Success', 'Welcome ${user.firstName}');
        }
      } else {
        if (!autoLogin) errorMessage.value = 'Invalid login credentials';
      }
    } catch (e) {
      if (!autoLogin) errorMessage.value = 'Login failed: $e';
    } finally {
      if (!autoLogin) isLoading.value = false;
    }
  }

  Future<void> logout() async {
    loggedInUser.value = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  bool get isLoggedIn => loggedInUser.value != null;
}