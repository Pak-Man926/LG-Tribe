import 'package:flutter/material.dart';
import "package:lg_tribe/Controller/login_controller_class.dart";
import "package:lg_tribe/Controller/registration_controller_class.dart";
import "package:lg_tribe/Homepage/Screens/Profile%20Page/Screens/about.dart";
import "package:lg_tribe/Homepage/Screens/Profile%20Page/profile.dart";
import "package:lg_tribe/Homepage/Screens/profilescreen.dart";
import "package:lg_tribe/Homepage/Screens/uploadscreen.dart";
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
  

initialBinding: BindingsBuilder(() {
  Get.put(UserStateController());
  Get.put(RegistrationController());
  Get.put(LoginController());
});


  runApp(
   MyApp()
  );
}

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
);

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Get.isDarkMode ? darkTheme : lightTheme,
        getPages: [
          GetPage(name: '/', page: () => SplashScreen()), //Initial Screem
          GetPage(name: '/start', page: () => Startpage()), // Second Screen
          GetPage(name: '/country', page: () => Country()), // Third Screen
          GetPage(name: '/login', page: () => Login()), // Fourth Screen
          GetPage(name: '/registration', page: () => UserRegistration()), // Alternative Fourth Screen1
          GetPage(name: '/forgot-password', page: () => Password()), // Alternative Fourth Screen2
          GetPage(name: '/homepage', page: () => Homepage()),// Fifth Screen
          GetPage(name: '/profile', page: () => ProfileScreen()),
          GetPage(name: '/upload', page: () => UploadScreen()),
          GetPage(name: '/about', page: () => About()),
          GetPage(name: '/logout', page: () => Logout()),
        ],
        initialRoute: '/',  // Set the initial screen to SplashScreen
      );
    }
  }



