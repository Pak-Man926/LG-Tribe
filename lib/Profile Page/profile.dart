import "package:flutter/material.dart";
import "package:lg_tribe/Homepage/homepage.dart";

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => Homepage()));
            },
            icon: Icon(Icons.arrow_back, color: Colors.blueGrey),
          ),
          centerTitle: true,
          title: Text(
            "Profile",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Esther Wanjiru',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Promoter | User ID: 123456",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 160),
                  //Brand Logo
                  Image(
                    image: AssetImage(
                      "assets/LGE_Logo_HeritageRed_Grey_RGB.png",
                    ),
                    height: 80,
                    width: 80,
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
