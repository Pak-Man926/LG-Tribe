import "dart:io";

import "package:flutter/material.dart";
import "package:get/get.dart";

class UploadImageScreen extends StatelessWidget
{
  const UploadImageScreen(File file, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.cancel_outlined),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text("Select Media Item", 
        style:TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
      ),
      body: Container(
        padding: EdgeInsets.all(0),
        
      ),
    );
  }
}