import "package:get/get.dart";
import "package:lg_tribe_client/lg_tribe_client.dart";
import "package:serverpod_flutter/serverpod_flutter.dart";
i

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
  void registerUser() {
    // Here you would typically call your backend API to register the user
    // For example:
    // UserEndpoints().registerUser(firstName.value, lastName.value, contacts.value, email.value, password.value);
    
    // After registration, you might want to navigate to another screen
    Get.toNamed('/userlogin'); // Navigate to login page after registration
  }
}