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
        title: Text("New Post",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: screenHeight * 0.5,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.file(file, fit: BoxFit.cover),
          ),
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: screenHeight * 0.2,
            decoration: BoxDecoration(
              color: Colors.white,
              //borderRadius: BorderRadius.horizontal(),
            ),
            child: TextField(
              //controller: ,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              minLines: 5,
              decoration: InputDecoration(
                labelText: "Write a caption...",
                hintText: "Type your caption here 😊",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height:15),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 80,
              //width: 20,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12, width: 1),
                ),
              child: MaterialButton(
                onPressed: () => Get.toNamed("/uploadscreen"),
                child: Text(
                  "Back", 
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12)
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 80,
              decoration: BoxDecoration(
                  color:  Color(0xFFA50034),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12, width: 1),
                ),
              child: MaterialButton(
                onPressed: () => Get.toNamed("/uploadscreen"),
                child: Text(
                  "Share", 
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12, color: Colors.white)
                ),
              ),
            ),
          ]  
          ),

        ],
      ),
    );
  }
}
