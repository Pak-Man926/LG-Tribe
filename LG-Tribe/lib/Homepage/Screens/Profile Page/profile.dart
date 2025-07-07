import "package:flutter/material.dart";
//import "package:lg_tribe/Homepage/homepage.dart";
import "package:get/get.dart";  

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.toNamed("/profilescreen"),
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
            //Personal Details
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
                          Text(
                            "+254 712 345 678",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text("ID Number"),
                          Text(
                            "1122334455",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Email"),
                          Text(
                            "promoter@lge.com",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            //Settings
            Container(
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey.shade400, thickness: 1),
                  SizedBox(height: 10),
                  //About App Button
                  MaterialButton(
                    onPressed: () => Get.toNamed("/aboutapp"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.info_outline, color: Colors.blueGrey),
                        SizedBox(width: 10),
                        Text("About App"),
                        Spacer(),
                          //alignment: Alignment.topRight,
                        Icon(Icons.arrow_forward_ios, size: 15),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  //Change Password Button
                  MaterialButton(
                    onPressed: () {
                      // Navigator.of(
                      //   context,
                      // ).push(MaterialPageRoute(builder: (context) => Login()));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.lock, color: Colors.blueGrey),
                        SizedBox(width: 10),
                        Text("Change Password"),
                        Spacer(),
                          //alignment: Alignment.topRight,
                        Icon(Icons.arrow_forward_ios, size: 15),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  //Call for Enquiries Button
                  MaterialButton(
                    onPressed: () {
                      // Navigator.of(
                      //   context,
                      // ).push(MaterialPageRoute(builder: (context) => Login()));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.call_sharp, color: Colors.blueGrey),
                        SizedBox(width: 10),
                        Text("Call for Enquiries"),
                        Spacer(),
                          //alignment: Alignment.topRight,
                        Icon(Icons.arrow_forward_ios, size: 15),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  //Logout Button
                  MaterialButton(
                    onPressed: () {
                      // Navigator.of(
                      //   context,
                      // ).push(MaterialPageRoute(builder: (context) => Login()));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.logout_outlined, color: Colors.blueGrey),
                        SizedBox(width: 10),
                        Text("Logout"),
                        Spacer(),
                          //alignment: Alignment.topRight,
                        Icon(Icons.arrow_forward_ios, size: 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
