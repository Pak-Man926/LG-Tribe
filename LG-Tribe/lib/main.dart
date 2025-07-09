import 'package:flutter/material.dart';
import "package:lg_tribe/Controller/login_controller_class.dart";
import "package:lg_tribe/Controller/registration_controller_class.dart";
import "package:lg_tribe/Homepage/Screens/Profile%20Page/Screens/about.dart";
import "package:lg_tribe/Homepage/Screens/Profile%20Page/profile.dart";
import "package:lg_tribe/Homepage/Screens/profilescreen.dart";
import 'package:lg_tribe/Splash_Screen/splash_screen.dart';
import "package:get/get.dart";
import "package:lg_tribe/Start_Page/startpage.dart";
import "package:lg_tribe/Country/country.dart";
import "package:lg_tribe/login/user_login.dart";
import "package:lg_tribe/Homepage/homepage.dart";
import "package:lg_tribe/login/registration/user_registration.dart";
import "package:lg_tribe/login/Forgot Password/forgot_password.dart";
import "package:lg_tribe/Controller/userstate_controller_class.dart";
import 'package:shared_preferences/shared_preferences.dart';
import "package:lg_tribe/Homepage/Screens/Profile Page/Screens/logout.dart";


void main() async
{
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter bindings are initialized
  await SharedPreferences.getInstance(); // Initialize SharedPreferences if needed


  Get.put(UserStateController());
  Get.put(LoginController()); 
  Get.put(RegistrationController());


  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,  
      //Route controller
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => SplashScreen()), // Initial route 
        GetPage(name: "/startpage", page: () => Startpage()), //Second route
        GetPage(name: "/country", page: () => Country()), // Third route
        GetPage(name: "/userlogin", page: () => Login() ),// Fourth route
        GetPage(name: "/userregistration", page: () => UserRegistration()), // Fifth route
        GetPage(name: "/forgotpassword", page: () => Password()), // Sixth route
        GetPage(name: "/homepage", page: () => Homepage()), // Seventh route
        GetPage(name: "/profilescreen", page: () => ProfileScreen()), // Eighth route
        GetPage(name: "/profilepage", page: () => Profile()), // Ninth route
        GetPage(name: "/aboutapp", page: () => About()), // Tenth route
        GetPage(name: "/logout", page: () => Logout()), // Eleventh route

      ],
    )
  );
}



