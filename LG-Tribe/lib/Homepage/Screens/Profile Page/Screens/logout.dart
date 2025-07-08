import "package:flutter/material.dart";

class Logout extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    return Scaffold(
      body:Padding(
        padding: EdgeInsetsGeometry.fromLTRB(0, 150, 0, 0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Log Out", 
              style: TextStyle(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Text("Are you sure you want to log out of your account?",
              style: TextStyle(fontWeight: FontWeight.w300)),
              SizedBox(height: 10),
              
            ]
          )
        )
      )
    );
  }
}