import "package:flutter/material.dart";
import "package:lg_tribe/Login/login.dart";

class Homepage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back,
            color: Colors.blueGrey
          ),
          centerTitle: true,
          title: Text("LG Tr!be", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
          backgroundColor: const Color.fromARGB(255, 245, 244, 242),
        ),
      )
    );
  }
}

