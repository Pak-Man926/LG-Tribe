import "package:get/get.dart";
import "package:lg_tribe/Controller/classes/authlevel_class.dart";
import "package:lg_tribe/Controller/classes/country_located_class.dart";

class UserStateController extends GetxController {
  var selectedAuthLevel = AuthLevel.merchandiser.obs;
  var selectedCountry = CountryLocated.kenya.obs;
  var isLoggedIn = false.obs;

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

  
}
