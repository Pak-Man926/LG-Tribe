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
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (Context, index) {
          return Card(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10, top: 10),
                      //Padding(padding: edgeInsets.all(10),),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          posts[index].userImageUrl,
                        ),
                        radius: 30,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      posts[index].username,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      posts[index].timestamp,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Column(children: [
                  
            ],
            ),
              ],
            ),
          );
        },
      ),
    );
  }
}
