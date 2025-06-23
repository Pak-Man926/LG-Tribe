import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import "package:lg_tribe/Controller/registration_controller_class.dart";
import "package:lg_tribe_client/lg_tribe_client.dart";
import "package:serverpod_flutter/serverpod_flutter.dart";
import "package:lg_tribe/login/user_login.dart";
import "package:get/get.dart";
import 'package:lg_tribe/Controller/userstate_controller_class.dart';
import "package:lg_tribe/main.dart";
import "package:lg_tribe/Controller/classes/authlevel_class.dart";
import "package:lg_tribe/Controller/classes/country_located_class.dart";

class UserRegistration extends StatelessWidget {
  final userState = Get.find<UserStateController>();
  final registrationState = Get.find<RegistrationController>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final contactNumberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            SizedBox(height: 10),
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
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "First Name:",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
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
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
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
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
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
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
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
                      initialCountryCode: userState.getInitialCountryCode(
                        userState.selectedCountry.value,
                      ),
                      onChanged: (contactNumber) {
                        // setState(() {
                        //   phoneNumber = phone.completeNumber;
                        // });
                        contactNumber.number = contactNumber.completeNumber;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Choose your country:",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  //Enter country of origin
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      () => DropdownButton<CountryLocated>(
                        value: userState.getCountry(),
                        items:
                            CountryLocated.values.map((country) {
                              return DropdownMenuItem(
                                value: country,
                                child: Text(country.name),
                              );
                            }).toList(),
                        onChanged: (newCountry) {
                          if (newCountry != null) {
                            userState.setCountry(newCountry);
                          }
                        },
                        iconEnabledColor: Color(0xFFA50034),
                        isExpanded: true,
                        iconSize: 24.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Choose your authentication level:",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  //Enter user auth level
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      () => DropdownButton<AuthLevel>(
                        value: userState.getAuthLevel(),
                        items:
                            AuthLevel.values.map((authLevel) {
                              return DropdownMenuItem(
                                value: authLevel,
                                child: Text(authLevel.value),
                              );
                            }).toList(),
                        onChanged: (newAuth) {
                          if (newAuth != null) {
                            userState.setAuthLevel(newAuth);
                          }
                        },
                        iconEnabledColor: Color(0xFFA50034),
                        isExpanded: true,
                        iconSize: 24.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Password:",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
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
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 150),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: FilledButton(
                        onPressed: () async {
                          final fName = firstNameController.text;
                          final lName = lastNameController.text;
                          final email = emailController.text;
                          final contactNumber =
                              int.tryParse(contactNumberController.text) ?? 0;
                          final password = passwordController.text;

                          await registrationState.registerUser(
                            firstName: fName,
                            lastName: lName,
                            contactNumber: contactNumber,
                            email: email,
                            password: password,
                            authenticationlevel:
                                userState.getAuthLevel().toServerModel(),
                            country: userState.getCountry().toServerModel(),
                          );
                        },
                        child: Text("Create Account"),
                      ),
                    ),
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
