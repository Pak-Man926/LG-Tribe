import 'package:flutter/material.dart';
import "package:lg_tribe/Homepage/Screens/models/homescreen_model.dart";

class Homescreen extends StatelessWidget {
  List<Post> posts = [
    Post(
      username: "Esther Wanjiru",
      userImageUrl: "https://picsum.photos/250?image=9",
      timestamp: "1hr ago",
      contentText:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      contentImageUrl: "https://picsum.photos/id/27/367/267",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              //Profile Picture
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 10, top: 10),
                //Padding(padding: edgeInsets.all(10),),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://picsum.photos/250?image=9",
                  ),
                  radius: 30,
                ),
              ),
              SizedBox(width: 10),
              //Username 
              Text(
                "Esther Wanjiru",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              //Timestamp
              Text(
                "1h ago",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w200),
              ),
            ],
          ),
          SizedBox(height: 5),
          //Post Content
          Container(
            height: 400,
            color: Colors.grey[300],
          ),
          //Below the post => Post caption, like and dislike buttons
          Row(children: [
            Padding(padding: EdgeInsets.only(top:8, left:5),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w200,
                      color: Colors.black,
                    ),
                  )
                ]
              ),
            ),
            ),
            Icon(Icons.arrow_upward),
            Icon(Icons.arrow_downward),
          ],)
        ],
      ),
    );
  }
}
