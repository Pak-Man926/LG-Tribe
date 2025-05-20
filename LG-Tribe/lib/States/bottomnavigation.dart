// import "package:flutter/material.dart";

// class BottomNavigation extends StatefulWidget {
//   final Function(int) onItemTapped;
//   final int selectedIndex;

//   const BottomNavigation({
//     Key? key,
//     required this.onItemTapped,
//     required this.selectedIndex,
//   }) : super(key: key);

//   @override
//   State<BottomNavigation> createState() => _BottomNavigationState();
// }

// class _BottomNavigationState extends State<BottomNavigation> {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       backgroundColor: const Color(0xFFA50034),
//       selectedItemColor: Colors.white,
//       unselectedItemColor: Colors.grey,
//       currentIndex: widget.selectedIndex,
//       onTap: widget.onItemTapped,
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.add_box_rounded),
//           label: "Upload",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.notification_add_rounded),
//           label: "Notifications",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person_2_rounded),
//           label: "Profile",
//         ),
//       ],
//     );
//   }
// }
