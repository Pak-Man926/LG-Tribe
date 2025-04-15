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
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                  //Brand Logo
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image(
                      image: AssetImage(
                        "assets/LGE_Logo_HeritageRed_Grey_RGB.png",
                      ),
                      height: 80,
                      width: 80,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Personal Information",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey.shade400, thickness: 1),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Phone Number"),
                          Text("+254 712 345 678", style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                      Column(
                        children: [
                          Text("ID Number"),
                          Text("1122334455", style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Email"),
                          Text("promoter@lge.com", style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ],
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
