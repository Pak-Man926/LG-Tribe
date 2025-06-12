import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import "package:lg_tribe_client/lg_tribe_client.dart";
import "package:serverpod_flutter/serverpod_flutter.dart";
import "package:lg_tribe/login/user_login.dart";
import "package:get/get.dart";
import 'package:lg_tribe/Controller/controller_class.dart';
import "package:lg_tribe/main.dart";

class UserRegistration extends StatelessWidget {
  final userState = Get.put(UserStateController());
  UserStateController controller = Get.find();
  //UserRegistration({super.key});

  String phoneNumber = '';
  String password = '';

  AuthLevel? authenticationlevel;
  CountryLocated? country;

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
      //Show error message if any field is empty
      Get.snackbar(
        "Error",
        "Please fill in all fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      final result = await client.userEndpoints.registerUser(
        firstName,
        lastName,
        contactNumber,
        email,
        password,
        authenticationlevel as AuthenticationLevel,
        country as Country,
      );

      if (result == true) {
        // Registration successful
        //print('User registered successfully');

        Get.snackbar(
          "Success",
          "User registered successfully",
          snackPosition: SnackPosition.BOTTOM,
        );

        // Navigate to the login page
        Get.offAllNamed(
          "/userlogin",
        ); // Clear all previous routes and navigate to the login page
      } else {
        // Registration failed
        //print("User registration failed!")
        Get.snackbar(
          "Error",
          "User registration failed",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context)
  {
    String initialCountryCode = getInitialCountryCode(userState.selectedCountry.value ?? CountryLocated.kenya);

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
                      initialCountryCode: initialCountryCode,
                      onChanged: (PhoneNumber) {
                        // setState(() {
                        //   phoneNumber = phone.completeNumber;
                        // });
                        PhoneNumber.number = PhoneNumber.completeNumber;
                      },
                    ),
                  ),
                  SizedBox(height: 5),
                  //Enter country of origin
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(
                        value: CountryLocated.kenya,
                        child: Text("Kenya"),
                      ),
                      DropdownMenuItem(
                        value: CountryLocated.ethopia,
                        child: Text("Ethiopia"),
                      ),
                      DropdownMenuItem(
                        value: CountryLocated.tanzania,
                        child: Text("Tanzania"),
                      ),
                      DropdownMenuItem(
                        value: CountryLocated.sudan,
                        child: Text("Sudan"),
                      ),
                      DropdownMenuItem(
                        value: CountryLocated.uganda,
                        child: Text("Uganda"),
                      ),
                      DropdownMenuItem(
                        value: CountryLocated.zambia,
                        child: Text("Zambia"),
                      ),
                    ],
                    onChanged: (CountryLocated? newValue) {
                      userState.setCountry(newValue);
                    },
                    iconEnabledColor: Color(0xFFA50034),
                    isExpanded: true,
                  ),
                  SizedBox(height: 10),
                  //Enter user auth level
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(
                        value: AuthLevel.merchandiser,
                        child: Text("Merchandiser"),
                      ),
                      DropdownMenuItem(
                        value: AuthLevel.promoter,
                        child: Text("Promoter"),
                      ),
                      DropdownMenuItem(
                        value: AuthLevel.floorServiceprovider,
                        child: Text("Floor Service Provider"),
                      ),
                    ],
                    onChanged: (AuthLevel? newValue) {
                      userState.setAuthLevel(newValue);
                    },
                    iconEnabledColor: Color(0xFFA50034),
                    isExpanded: true,
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

String getInitialCountryCode(CountryLocated country)
{
  switch (country) {
    case CountryLocated.kenya:
      return 'KE';
    case CountryLocated.ethopia:
      return 'ET';
    case CountryLocated.tanzania:
      return 'TZ';
    case CountryLocated.sudan:
      return 'SD';  
    case CountryLocated.uganda:
      return 'UG';
    case CountryLocated.zambia:
      return 'ZM';
    default:
      return 'KE'; // Default to Kenya if no country is selected
  }
}
