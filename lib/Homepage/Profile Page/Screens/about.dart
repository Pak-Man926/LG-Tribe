import 'package:flutter/material.dart';
import "package:lg_tribe/Homepage/Profile Page/profile.dart";
class About extends StatelessWidget
{
  const About({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => Profile()));
          },
          color: Colors.blueGrey,
        ),
        centerTitle: true,
        title: Text(
          "About App",
          style: TextStyle(
            fontSize: 15,
            color: const Color.fromARGB(255, 8, 8, 8),
          )
        )
      ),
       body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/LGE_Logo_HeritageRed_Grey_RGB.png",
              height: 100,
              width: 100,
            ),
            Text(
              "LG Management System",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )
            ),
            SizedBox(height: 20),
            Text(
              "Version 1.0.0",
              style: TextStyle(
                fontSize: 15,
                color: const Color.fromARGB(255, 199, 198, 198),
              )
            ),
            SizedBox(height: 5),
            Text(
              "Build Number: 67",
              style: TextStyle(
                fontSize: 15,
                color: const Color.fromARGB(255, 199, 198, 198),
              )
            ),
            SizedBox(height: 10),
            Text(
              "Copyright",
              style: TextStyle(
                fontSize: 15,
                color: const Color.fromARGB(255, 199, 198, 198),
              )
              ),
            SizedBox(height: 3),
            Text(
              "© 2023 LG Tribe",
              style: TextStyle(
                fontSize: 15,
                color: const Color.fromARGB(255, 199, 198, 198),
              )
            ),
          ],
        ), 
       )
    );
  }
}