import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';

class UserRegistration extends StatelessWidget
{
  const UserRegistration({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body:SafeArea(
        child: Form(
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Positioned(
                top: 50,
                left: 20,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/LGE_Logo_HeritageRed_Grey_RGB.png'),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  width: 100,
                  height: 100,
                ),
              ),
              SizedBox(height: 50),
              Text("Welcome to LG Tribe!"),
            ]
          )
        ),
      )
    );
  }
}