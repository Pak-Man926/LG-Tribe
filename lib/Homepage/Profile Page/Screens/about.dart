import 'package:flutter/material.dart';
import "package:lg_tribe/Homepage/Profile Page/profile.dart";
class About extends StatelessWidget
{
  const About({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => Profile()));
          },
          color: Colors.blueGrey,
        ),
        centerTitle: true,
        title: Text(
          "About App",
          style: TextStyle(
            fontSize: 15,
            color: Colors.blueGrey,
          )
        )
      ),
       body: Center(
         child: Column(
          children: [
            Text("Hello"),
          ],
         ) 
       )
    );
  }
}