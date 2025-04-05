import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 10, top: 10),
                //Padding(padding: edgeInsets.all(10),),
                child:CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://picsum.photos/250?image=9",
                  ),
                  radius: 30,
                ),
              ),
              SizedBox(width: 10),
                Text(
                  "Esther Wanjiru",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text(
                  "1h ago",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w200),
                ),
            ],
          ),
          SizedBox(height: 5),
          Column(
            children: [
              
            ],
            )
        ],
      ),
    );
  }
}
