import "package:get/get.dart";

class UserStateController extends GetxController
{
  var selectedAuthLevel = Rx<AuthLevel?>(null);
  var selectedCountry = Rx<CountryLocated?>(null);
  var isLoggedIn = false.obs;
  

  void setAuthLevel(AuthLevel? level)
  {
    selectedAuthLevel.value = level;  
  }

  void setCountry(CountryLocated? country)
  {
    selectedCountry.value = country;  
  }

  AuthLevel? getAuthLevel()
  {
    return selectedAuthLevel.value;
  }
  CountryLocated? getCountry()
  {
    return selectedCountry.value;
  }
}  
