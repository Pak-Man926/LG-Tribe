import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';

class UserRegistration extends StatelessWidget {
  const UserRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Positioned(
              top: 50,
              left: 30,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/LGE_Logo_HeritageRed_Grey_RGB.png',
                    ),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                width: 100,
                height: 100,
              ),
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to LG Tribe! Please enter your details to continue.",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
              ),
            ],
          ),
          SizedBox(height: 10),
          Column(
           crossAxisAl            
          )
        ],
      ),
    );
  }
}
