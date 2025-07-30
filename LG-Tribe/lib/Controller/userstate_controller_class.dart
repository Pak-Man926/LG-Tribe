import "package:get/get.dart";
import "package:lg_tribe/Controller/classes/authlevel_class.dart";
import "package:lg_tribe/Controller/classes/country_located_class.dart";

class UserStateController extends GetxController {
  var selectedAuthLevel = AuthLevel.merchandiser.obs;
  var selectedCountry = CountryLocated.kenya.obs;
  var firstName = ''.obs;
  var lastName = ''.obs;
  var contacts = ''.obs;
  var email = ''.obs;
  //var isLoggedIn = false.obs;

  // Method to set user details
  void setUserDetails({
    required String firstName,
    required String lastName,
    required String contacts,
    required String email,
  }) {
    this.firstName.value = firstName;
    this.lastName.value = lastName;
    this.contacts.value = contacts;
    this.email.value = email;
  }
  // Method to get user details
  Map<String, String> getUserDetails() {
    return {
      'firstName': firstName.value,
      'lastName': lastName.value,
      'contacts': contacts.value,
      'email': email.value,
    };
  }
  //Auth level getter
  AuthLevel getAuthLevel() {
    return selectedAuthLevel.value;
  }

  //Auth level setter
  void setAuthLevel(AuthLevel value) {
    selectedAuthLevel.value = value;
  }

  //Country getter
  CountryLocated getCountry() {
    return selectedCountry.value;
  }

  //Country setter
  void setCountry(CountryLocated country) {
    selectedCountry.value = country;
  }

  String getInitialCountryCode(CountryLocated country) {
    switch (country) {
      case CountryLocated.kenya:
        return 'KE';
      case CountryLocated.ethopia:
        return 'ET';
      case CountryLocated.tanzania:
        return 'TZ';
      case CountryLocated.sudan:
        return 'SD';
      case CountryLocated.uganda:
        return 'UG';
      case CountryLocated.zambia:
        return 'ZM';
      default:
        return 'KE'; // Default to Kenya if no country is selected
    }
  }
}
