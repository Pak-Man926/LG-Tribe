import "package:flutter/material.dart";
import "package:lg_tribe/Login/login.dart";
import "package:lg_tribe/States/bottomnavigation.dart";

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _children = [
    Center(child: Text("Home")),
    Center(child: Text("Upload")),
    Center(child: Text("Notifications")),
    Center(child: Text("Profile")),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back, color: Colors.blueGrey),
          centerTitle: true,
          title: Text(
            "LG Tr!be",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          backgroundColor: const Color.fromARGB(255, 245, 244, 242),
        ),
        body: _children[_selectedIndex],
        bottomNavigationBar: bottomNavigator(),
      ),
    );
  }

  BottomNavigationBar bottomNavigator() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      backgroundColor: Color(0xFFA50034),
      selectedItemColor: Colors.white, // Adjust this based on your UI
      unselectedItemColor: Colors.grey,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: "Home",
          //backgroundColor: Color(0xFFA50034),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box_rounded),
          label: "Upload",
          //backgroundColor: Color(0xFFA50034),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notification_add_rounded),
          label: "Notifications",
          //backgroundColor: Color(0xFFA50034),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_rounded),
          label: "Profile",
          //backgroundColor: Color(0xFFA50034),
        ),
      ],
    );
  }
}
