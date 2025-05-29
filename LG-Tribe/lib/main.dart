import 'package:flutter/material.dart';
import 'package:lg_tribe/Splash_Screen/splash_screen.dart';
import "package:get/get.dart";

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,  
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => SplashScreen()),
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


