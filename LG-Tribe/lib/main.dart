import 'package:flutter/material.dart';
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


void main()
{
  Get.put(UserStateController()); // Initialize the UserStateController
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,  
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => SplashScreen()), // Initial route 
        GetPage(name: "/startpage", page: () => Startpage()), //Second route
        GetPage(name: "/country", page: () => Country()), // Third route
        GetPage(name: "/userlogin", page: () => Login() ),// Fourth route
        GetPage(name: "/userregistration", page: () => UserRegistration()), // Fifth route
        GetPage(name: "/forgotpassword", page: () => Password()), // Sixth route
        GetPage(name: "/homepage", page: () => Homepage()),
        GetPage(name: "/profilescreen", page: () => ProfileScreen()),
        GetPage(name: "/profilepage", page: () => Profile()),
        GetPage(name: "/aboutapp", page: () => About()), 

      ],
    )
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen(),
//     );
//   }
// }


