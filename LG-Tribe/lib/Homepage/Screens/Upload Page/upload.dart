import "dart:io";

import "package:flutter/material.dart";
import "package:get/get.dart";

class UploadImageScreen extends StatelessWidget {
  final File file;
  const UploadImageScreen(this.file, {super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.cancel_outlined),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text("Select Media Item",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
      ),
      body: Container(
        width: double.infinity,
        height: screenHeight * 0.5,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10), child: Image.file(file)),
      ),
    );
  }
}
