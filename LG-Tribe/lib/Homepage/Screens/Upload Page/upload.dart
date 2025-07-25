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
        )
        centerTitle: true,,
      ),
      
    );
  }
}