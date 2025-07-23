import "package:flutter/material.dart";
import "package:get/get.dart";

class UploadImageScreen extends StatelessWidget
{
  const UploadImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uploaded Image"),
        backgroundColor: Color(0xFFA50034),
      ),
      body: Center(
        child: Text(
          "This is the screen for the uploaded image.",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}