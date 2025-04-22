import 'package:flutter/material.dart';
import 'package:lg_tribe/Country/country.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lg_tribe/Forgot%20Password/forgot_password.dart';
import 'package:lg_tribe/Homepage/homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget 
{
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String phoneNumber = '';
  String password = '';

  Future<void> loginUser() async {
    final url = Uri.parse('http://localhost:8080/users');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'phoneNumber': phoneNumber,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      print('✅ Login successful: ${response.body}');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
    } else {
      print('❌ Login failed: ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed. Check credentials.')),
      );
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
                      image: AssetImage('assets/LGE_Logo_HeritageRed_Grey_RGB.png'),
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
                    Text(
                      "Welcome back! Please enter your details",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone Number:", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                        SizedBox(height: 5),
                        IntlPhoneField(
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
                        Text("Password:", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                        SizedBox(height: 5),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(border: OutlineInputBorder()),
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
                            Row(children: [
                              Checkbox(
                                value: false,
                                onChanged: (bool? value) {},
                              ),
                              Text("Remember me for 30 days"),
                            ]),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Password()),
                                );
                              },
                              child: Text("Forgot Password?", style: TextStyle(color: Color(0xFFA50034))),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Padding(padding: EdgeInsets.all(10)),
                        SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                            onPressed: loginUser,
                            color: Color(0xFFA50034),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(),
                            ),
                            child: Text("Sign In", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                            onPressed: () {},
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(),
                            ),
                            child: Text("Sign in as different user", style: TextStyle(color: Colors.black)),
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
