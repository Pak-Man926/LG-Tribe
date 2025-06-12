import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import "package:lg_tribe_client/lg_tribe_client.dart";
import "package:serverpod_flutter/serverpod_flutter.dart";
import "package:lg_tribe/login/user_login.dart";
import "package:get/get.dart";
//import 'package:http/http.dart' as http;
//import 'dart:convert';
import 'package:lg_tribe/Controller/controller_class.dart';


final userState = Get.put(UserStateController());

class UserRegistration extends StatefulWidget {
  const UserRegistration({super.key});

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  String phoneNumber = '';
  String password = '';

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final contactNumberController = TextEditingController();
  final passwordController = TextEditingController();

  var client = Client('http://localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    contactNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final email = emailController.text;
    final contactNumber = int.tryParse(contactNumberController.text);
    final password = passwordController.text;

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        contactNumber == null ||
        password.isEmpty) {
      // Show error message
      return;
    }

    try {
      final result = await client.userEndpoints.registerUser(
        firstName,
        lastName,
        contactNumber,
        email,
        password,
        authlevel,
        country,
      );

      if (result == true) {
        // Registration successful
        //print('User registered successfully');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User registered successfully'),
            duration: Duration(seconds: 2),
          ),
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      } else {
        // Registration failed
        //print("User registration failed!")
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User registration failed!'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }

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
          SingleChildScrollView(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "First Name:",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your first name',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Last Name:",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your last name',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Email:",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your email address',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Phone Number:",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IntlPhoneField(
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
                  ),
                  SizedBox(height: 5),
                  //Enter country of origin
                  DropdownButton(
                    items: const[
                      DropdownMenuItem(child: Text("Kenya"), value: CountryLocated.kenya),
                      DropdownMenuItem(child: Text("Ethiopia"), value: CountryLocated.ethopia),
                      DropdownMenuItem(child: Text("Tanzania"), value: CountryLocated.tanzania),
                      DropdownMenuItem(child: Text("Sudan"), value: CountryLocated.sudan),
                      DropdownMenuItem(child: Text("Uganda"), value: CountryLocated.uganda),
                      DropdownMenuItem(child: Text("Zambia"), value: CountryLocated.zambia),
                    ], 
                    onChanged: (CountryLocated? newValue) {
                      userState.setCountry(newValue);
                    },
                    iconEnabledColor:  Color(0xFFA50034),
                    
                    ),
                    SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Password:",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your password',
                      ),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: FilledButton(
                        onPressed: () async {
                          await _register();
                        },
                        child: Text("Create Account"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
