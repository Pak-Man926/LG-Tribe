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
  var loggedInUser = Rxn<User>();
  
  //var isLoggedIn = false.obs;
  loggedInUser.value = User(
          firstName: firstName,
          lastName: lastName,
          contacts: contactNumber,
          email: email,
          password: password,
          authlevel: authenticationLevel,
          country: country,
        );
  
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
