import "package:get/get.dart";

enum AuthLevel
{
  merchandiser,
  promoter,
  floorServiceprovider,
}

enum Country
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
  var selectedCountry = Rx<Country?>(null);
  var isLoggedIn = false.obs;
  var userName = "".obs;

  void setAuthLevel(AuthLevel? level)
  {
    selectedAuthLevel.value = level;  
  }

  void setCountry(Country? country)
  {
    selectedCountry.value = country;  
  }

  void setUsername(String name)
  {
    userName.value = name;
  }

  void login(String User)
  {
    isLoggedIn.value = true;
    userName.value = User;
  }
}