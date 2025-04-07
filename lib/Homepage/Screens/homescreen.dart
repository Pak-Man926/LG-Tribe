import 'package:flutter/material.dart';
import "package:lg_tribe/Homepage/Screens/models/homescreen_model.dart";

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool isReadMore = false;

  List<Post> posts = [
    Post(
      username: "Esther Wanjiru",
      userImageUrl: "https://picsum.photos/250?image=9",
      timestamp: "1hr ago",
      contentText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      contentImageUrl: "https://picsum.photos/id/27/367/267",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile section
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 10, top: 10),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(posts[0].userImageUrl),
                  radius: 30,
                ),
              ),
              SizedBox(width: 10),
              Text(
                posts[0].username,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Text(
                posts[0].timestamp,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w200),
              ),
            ],
          ),
          SizedBox(height: 5),

          // Post image
          Container(
            height: 200,
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(posts[0].contentImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Post caption and buttons
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        posts[0].contentText,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w200,
                          color: Colors.black,
                        ),
                        maxLines: isReadMore ? null : 2,
                        overflow:
                            isReadMore
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isReadMore = !isReadMore;
                          });
                        },
                        child: Text(
                          isReadMore ? 'Read less' : 'Read more',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_upward),
                    Icon(Icons.arrow_downward),
                  ],
                ),
              ]
              ),
            ],
          ),
        ],
      ),
    );
  }
}
