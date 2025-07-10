import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lg_tribe/Controller/login_controller_class.dart';

class Logout extends StatelessWidget {
  final loginState = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(16.0), 
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Log Out",
                    style: TextStyle(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Are you sure you want to log out of your account?",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFA50034),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MaterialButton(
                      onPressed: () async {
                        await loginState.logout();
                      },
                      color: Color(0xFFA50034),
                      shape: RoundedRectangleBorder(),
                      child: Text(
                        "Yes, logout",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFA50034),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MaterialButton(
                      onPressed: () async {
                        Get.toNamed("/profilepage");
                      },
                      color: Colors.white,
                      shape: RoundedRectangleBorder(),
                      child: Text(
                        "No, take me back",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
