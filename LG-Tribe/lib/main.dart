import 'package:flutter/material.dart';
import 'package:lg_tribe/Splash_Screen/splash_screen.dart';
import "package:get/get.dart";
import "package:lg_tribe/Start_Page/startpage.dart";

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,  
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/startpage", page: () => Startpage()),
        
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


