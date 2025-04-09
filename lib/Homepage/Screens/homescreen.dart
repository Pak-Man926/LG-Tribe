import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool isReadMore = false;
  int _voteCount = 0;

  void _incrementVote() {
    setState(() {
      _voteCount++;
    });
  }

  void _decrementVote() {
    setState(() {
      _voteCount--;
    });
  }

  // Sample data for posts
  final List<Map<String, String>> posts = [
    {
      "username": "Esther Wanjiru",
      "timestamp": "1h ago",
      "imageUrl": "https://picsum.photos/250?image=9",
      "caption": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    },
    {
      "username": "John Doe",
      "timestamp": "2h ago",
      "imageUrl": "https://picsum.photos/250?image=8",
      "caption": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    },
    {
      "username": "Jane Smith",
      "timestamp": "3h ago",
      "imageUrl": "https://picsum.photos/250?image=7",
      "caption": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length, // Number of posts
        itemBuilder: (context, index) {
          var post = posts[index]; // Get post data

          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile section
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(post['imageUrl']!),
                      radius: 30,
                    ),
                    SizedBox(width: 10),
                    Text(
                      post['username']!,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Text(
                      post['timestamp']!,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Post Image
                SizedBox(
                  height: 400,
                  child: Image.network(
                    post['imageUrl']!,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                // Post Caption + Read More Toggle
                Text(
                  isReadMore
                      ? post['caption']!
                      : '${post['caption']!.substring(0, 60)}...',
                  style: TextStyle(fontSize: 14),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isReadMore = !isReadMore;
                    });
                  },
                  child: Text(
                    isReadMore ? 'Read less' : 'Read more',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ),
                SizedBox(height: 10),
                // Upvote and Downvote Buttons
                Row(
                  children: [
                    IconButton(
                      iconSize: 22,
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: _incrementVote,
                      icon: Icon(
                        Icons.arrow_upward_outlined,
                        color: Colors.black87,
                      ),
                      tooltip: "Upvote",
                    ),
                    SizedBox(width: 5),
                    IconButton(
                      iconSize: 22,
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: _decrementVote,
                      icon: Icon(
                        Icons.arrow_downward_outlined,
                        color: Colors.black87,
                      ),
                      tooltip: "Downvote",
                    ),
                    SizedBox(width: 10),
                    Text(
                      '$_voteCount',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
