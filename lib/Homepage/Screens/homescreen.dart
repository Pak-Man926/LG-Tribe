import 'package:flutter/material.dart';
import "package:lg_tribe/Homepage/Screens/models/homescreen_model.dart";

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool isReadMore = false;

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
          Container(height: 400, color: Colors.grey[300]),
          //Below the post => Post caption, like and dislike buttons
          Row(
            children: [
              //Post caption
                Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    isReadMore
                        ? "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                        : "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                    maxLines: isReadMore ? null : 2,
                    overflow: isReadMore ? null : TextOverflow.ellipsis,
                  ),
                ),
                ),
              //Icon(Icons.arrow_upward),
              //Icon(Icons.arrow_downward),
            ],
          ),
        ],
      ),
    );
  }
}
