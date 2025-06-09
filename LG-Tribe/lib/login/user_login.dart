import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
//import 'package:lg_tribe/Forgot%20Password/forgot_password.dart';
//import 'package:lg_tribe/Homepage/homepage.dart';
//import "package:lg_tribe/login/registration/user_registration.dart";
import "package:lg_tribe_client/lg_tribe_client.dart";
import "package:serverpod_flutter/serverpod_flutter.dart";
import "package:get/get.dart";
import "package:lg_tribe/Controller/controller_class.dart";

class Login extends StatelessWidget 
{
  final userState = Get.put(UserStateController());

  final contactNumberController = TextEditingController();
  final passwordController = TextEditingController();

  var client = Client('http://localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();

  @override
  void dispose()
  {
    contactNumberController.dispose();
    passwordController.dispose();
  }

  // void attemptLogin() async
  // {
  //   final phoneNumber = contactNumberController.text;
  //   final password = passwordController.text;

  //   if (phoneNumber.isEmpty || password.isEmpty)
  //   {
  //     Get.snackbar("Error", "Please fill in all fields",
  //         snackPosition: SnackPosition.BOTTOM);
  //   }

  //   return;
  // }

  Future<void> _login() async {
    final phoneNumber = int.tryParse(contactNumberController.text);
    final password = passwordController.text;

    if (phoneNumber == null || password.isEmpty)
    {
      Get.snackbar("Error", "Please fill in all fields",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try
    {
      final result = await client.userEndpoints.loginUser(phoneNumber, password);

      if (result != null)
      {
        userState.userName.value = result.firstName + " " + result.lastName;
        Get.toNamed("/homepage");
      }
      else 
      {
        Get.snackbar("Error", "Invalid phone number or password",
            snackPosition: SnackPosition.BOTTOM);
      }
    }
    catch (e)
    {
      Get.snackbar("Error", "An error occurred while logging in",
          snackPosition: SnackPosition.BOTTOM);
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                    Text("${userState.selectedCountry.value}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 10),
                    Text(
                      "Welcome back! Please enter your details",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                      ),
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
                        IntlPhoneField(
                          controller: contactNumberController,
                          decoration: const InputDecoration(
                            hintText: "Enter your phone number",
                            border: OutlineInputBorder(),
                          ),
                          initialCountryCode: 'KE',
                          onChanged: (phone) {
                            setState(() {
                              phoneNumber = phone.completeNumber;
                            });
                          },
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
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
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
                              await _login();

                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => Homepage()));
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
                            "Don't have an account? Sign up",
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
      ),
    );
  }
}
