import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:lg_tribe/Controller/login_controller_class.dart";
class Logout extends StatelessWidget {
  final loginState = Get.find<LoginController>();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.fromLTRB(0, 150, 0, 0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Log Out",
                style: TextStyle(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Text(
                "Are you sure you want to log out of your account?",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () async{
                    //Attempt to logout
                    await loginState.logout();
                  },
                  color: Color(0xFFA50034),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(),
                  ),
                  child: Text("Yes, logout", style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height: 5),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () async{
                    //Cancel logout
                    Get.toNamed("/profilepage");
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(),
                  ),
                  child: Text("No, take me back", style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
