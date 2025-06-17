import "package:get/get.dart";

enum AuthLevel
{
  merchandiser,
  promoter,
  floorServiceprovider,
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
  var firstName = "".obs;
  var secondName = "".obs;
  var phoneNumber = "".obs;
  var email = "".obs;
  var userName = "".obs;
  var dropDownvalueItems = "".obs;

  void setAuthLevel(AuthLevel? level)
  {
    selectedAuthLevel.value = level;  
  }

  void setCountry(CountryLocated? country)
  {
    selectedCountry.value = country;  
  }

  void setFirstname(String firstName)
  {
    this.firstName.value = firstName;
  }
  void setSecondName(String secondName)
  {
    this.secondName.value = secondName;
  }
  void setPhoneNumber(String phoneNumber)
  {
    this.phoneNumber.value = phoneNumber;
  }
  void setEmail(String email)
  {
    this.email.value = email;
  }
}  
