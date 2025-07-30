// import "dart:async";
// import "package:serverpod/serverpod.dart";

// class PostsEndpoints extends Endpoint
// {
//   Future<bool> createPost(
//       Session session, String caption, String imageUrl, String username,) async {
//     // Validate input
//     if (caption.isEmpty || imageUrl.isEmpty) {
//       return false; // Invalid input
//     }

//     // Create a new post
//     final post = Post(caption: caption, imageUrl: imageUrl);

//     // Insert the post into the database
//     await Post.db.insertRow(session, post);

//     return true; // Post created successfully
//   }
// }