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
  var selectedAuthLevel = <AuthLevel?>[].obs;
  var selectedCountry = <Country?>[].obs;
  var isLoggedIn = false.obs;
  var userName = "".obs;

  void setAuthLevel(AuthLevel? level)
  {
    selectedAuthLevel.value = [level];  
  }

  void setCountry(Country? country)
  {
    selectedCountry.value = [country];  
  }

  void setUsername(String name)
  {
    userName.value = name;
  }

  void login(String user)
  {
    isLoggedIn.value = true;
    userName.value = user;
  }

  void logout()
  {
    isLoggedIn.value = false;
    userName.value = "";
    selectedAuthLevel.value = [];
    selectedCountry.value = [];
  }
}