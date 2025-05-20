import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class LoginController {
  Future<void> loginUser({
    String? phoneNumber,
    String? password,
    BuildContext? context,
  }) async {
    final url = Uri.parse('http://localhost:8080/users');

    print('✅ Url: $url');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "userName": "Alex",
        "password": "12345678",
        "email": "alex20@gmail.com",
        "phoneNumber": "0721709973",
      }),
    );

    // if (response.statusCode == 200) {
    //   print('✅ Login successful: ${response.body}');r
    //   Navigator.push(
    //     context!,
    //     MaterialPageRoute(builder: (context) => Homepage()),
    //   );
    // } else {
    //   print('❌ Login failed: ${response.body}');
    //   ScaffoldMessenger.of(context!).showSnackBar(
    //     SnackBar(content: Text('Login failed. Check credentials.')),
    //   );
    // }
  }
}
