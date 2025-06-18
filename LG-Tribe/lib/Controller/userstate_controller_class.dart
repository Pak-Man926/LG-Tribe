import "package:get/get.dart";
import 'authlevel_class.dart';
import 'countrylocated_class.dart';

class UserStateController extends GetxController
{
  var selectedAuthLevel = AuthLevel.merchandiser.obs;
  var selectedCountry = CountryLocated.kenya.obs;
  var isLoggedIn = false.obs;
  
}  
