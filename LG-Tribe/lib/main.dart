import 'package:flutter/material.dart';
import 'package:lg_tribe/Splash_Screen/splash_screen.dart';
import "package:get/get.dart";
import "package:lg_tribe/Start_Page/startpage.dart";
import "package:lg_tribe/Country/country.dart";
import "package:lg_tribe/login/user_login.dart";
import "package:lg_tribe/Homepage/homepage.dart";


void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,  
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => SplashScreen()), // Initial route 
        GetPage(name: "/startpage", page: () => Startpage()),
        GetPage(name: "/country", page: () => Country()),
        GetPage(name: "/userlogin", page: () => Login() ),
        GetPage(name: "/homepage", page: () => Homepage()),

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


