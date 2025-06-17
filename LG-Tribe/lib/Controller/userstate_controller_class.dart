import "package:get/get.dart";

enum AuthLevel
{
  Merchandiser,
  Promoter,
  FloorServiceprovider,
}

enum CountryLocated
{
  kenya,
  ethopia,
  tanzania,
  sudan,
  uganda,
  zambia,
}

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
