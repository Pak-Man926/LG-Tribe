import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import "package:lg_tribe_client/lg_tribe_client.dart";
import "package:serverpod_flutter/serverpod_flutter.dart";
import "package:get/get.dart";
import "package:lg_tribe/Controller/userstate_controller_class.dart";
import "package:lg_tribe/Controller/login_controller_class.dart";
import "package:lg_tribe/Controller/classes/authlevel_class.dart";
import "package:lg_tribe/Controller/classes/country_located_class.dart";

class Login extends StatelessWidget {
  final userState = Get.find<UserStateController>();
  final loginState = Get.find<LoginController>();

  final contactNumberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 20,
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
            Positioned(
              top: 250,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      userState.selectedAuthLevel.value.value,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  Text(
                    "Welcome back! Please enter your details",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone Number:",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Obx(
                        () => IntlPhoneField(
                          controller: contactNumberController,
                          decoration: const InputDecoration(
                            hintText: "Enter your phone number",
                            border: OutlineInputBorder(),
                          ),
                          initialCountryCode: userState.getInitialCountryCode(
                            userState.selectedCountry.value,
                          ),
                          onChanged: (phoneNumber) {
                            // Optional: store this in state
                            // print("Phone: ${phoneNumber.completeNumber}");
                          },
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Password:",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (bool? value) {},
                              ),
                              Text("Remember me for 30 days"),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed("/forgotpassword"),
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: Color(0xFFA50034)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Padding(padding: EdgeInsets.all(10)),
                      SizedBox(                        
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () async {
                            //Attempt to login
                            final contactNumber =
                                int.tryParse(contactNumberController.text) ?? 0;
                            final password = passwordController.text;

                            await loginState.loginUser(
                              contactNumber: contactNumber,
                              password: password,
                              authenticationLevel: userState.getAuthLevel().toServerModel(),
                              country: userState.getCountry().toServerModel(),
                            );
                          },
                          color: Color(0xFFA50034),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(),
                          ),
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () => Get.toNamed("/startpage"),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(),
                          ),
                          child: Text(
                            "Sign in as different user",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      GestureDetector(
                        onTap: () => Get.toNamed("/userregistration"),
                        child: Text(
                          "Don't have an account?   Sign up",
                          style: TextStyle(color: Color(0xFFA50034)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
