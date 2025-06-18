import "package:get/get.dart";
import "package:lg_tribe/Controller/classes/authlevel_class.dart";
import "package:lg_tribe/Controller/classes/country_located_class.dart";

class UserStateController extends GetxController
{
  var selectedAuthLevel = AuthLevel.merchandiser.obs;
  var selectedCountry = CountryLocated.kenya.obs;
  var isLoggedIn = false.obs;
  
  void updateAuth(AuthLevel level)
  {
    selectedAuthLevel.value = level;
  }
  void setCountry(CountryLocated country)
  {
    selectedCountry.value = country;
  }
}  
