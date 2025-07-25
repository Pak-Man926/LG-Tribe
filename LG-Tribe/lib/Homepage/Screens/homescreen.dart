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

  final List<Map<String, String>> posts = [
    {
      "username": "Esther Wanjiru",
      "timestamp": "1h ago",
      "imageUrl": "assets/user1.jpg",
      "caption":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    },
    {
      "username": "John Doe",
      "timestamp": "2h ago",
      "imageUrl": "assets/user2.jpg",
      "caption":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    },
    {
      "username": "Jane Smith",
      "timestamp": "3h ago",
      "imageUrl": "assets/user3.jpg",
      "caption":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScale = screenWidth * 0.035;

    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          var post = posts[index];

          return Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile section
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(post['imageUrl']!),
                      radius: screenWidth * 0.08,
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post['username']!,
                            style: TextStyle(
                              fontSize: textScale + 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            post['timestamp']!,
                            style: TextStyle(
                              fontSize: textScale,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.015),
                // Post Image
                Container(
  width: double.infinity,
  height: screenHeight * 0.5,
  decoration: BoxDecoration(
    color: Colors.black12,
    borderRadius: BorderRadius.circular(10),
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Image.asset(
      post['imageUrl']!,
      fit: BoxFit.cover,
    ),
  ),
),


                SizedBox(height: screenHeight * 0.015),
                // Post Caption + Read More Toggle
                Text(
                  isReadMore
                      ? post['caption']!
                      : "${post['caption']!.substring(0, post['caption']!.length.clamp(0, 60))}...",
                  style: TextStyle(fontSize: textScale),
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
                      fontSize: textScale,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                // Vote buttons
                Row(
                  children: [
                    IconButton(
                      iconSize: screenWidth * 0.05,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: _incrementVote,
                      icon: const Icon(Icons.arrow_upward_outlined),
                      tooltip: "Upvote",
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    IconButton(
                      iconSize: screenWidth * 0.05,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: _decrementVote,
                      icon: const Icon(Icons.arrow_downward_outlined),
                      tooltip: "Downvote",
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Text('$_voteCount', style: TextStyle(fontSize: textScale)),
                  ],
                ),
                Divider(thickness: 1.2),
              ],
            ),
          );
        },
      ),
    );
  }
}
