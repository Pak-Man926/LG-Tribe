import 'package:flutter/material.dart';
import "package:lg_tribe/Homepage/Screens/models/homescreen_model.dart";

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildProfileRow(),
              _buildPostImage(),
              _buildPostCaption(),
              _buildVoteButtons(),
            ],
          ),
        ),
      ),
    );
  }

  // Profile row with image and text
  Widget _buildProfileRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage("https://picsum.photos/250?image=9"),
            radius: 30,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Esther Wanjiru",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                "1h ago",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Post image with height 400
  Widget _buildPostImage() {
    return Container(
      height: 400,
      child: Image.network(
        "https://picsum.photos/250?image=9",
        fit: BoxFit.cover,
      ),
    );
  }

  // Post caption and read more toggle
  Widget _buildPostCaption() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isReadMore
                ? "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                : "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            maxLines: isReadMore ? null : 2,
            overflow: isReadMore ? null : TextOverflow.ellipsis,
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
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Upvote and downvote buttons
  Widget _buildVoteButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          _buildVoteButton(
            icon: Icons.arrow_upward_outlined,
            onPressed: _incrementVote,
            tooltip: "Upvote",
          ),
          SizedBox(width: 5),
          _buildVoteButton(
            icon: Icons.arrow_downward_outlined,
            onPressed: _decrementVote,
            tooltip: "Downvote",
          ),
          SizedBox(width: 10),
          Text('$_voteCount', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  // Single vote button widget
  Widget _buildVoteButton({
    required IconData icon,
    required VoidCallback onPressed,
    required String tooltip,
  }) {
    return IconButton(
      iconSize: 22,
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(),
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.black87),
      tooltip: tooltip,
    );
  }
}
