import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding:EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Lorem Ipsum'),
              subtitle: const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              ),
              trailing: const Icon(Icons.more_vert_rounded),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding:EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Lorem Ipsum'),
              subtitle: const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              ),
              trailing: const Icon(Icons.more_vert_rounded),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding:EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Lorem Ipsum'),
              subtitle: const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              ),
              trailing: const Icon(Icons.more_vert_rounded),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding:EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Lorem Ipsum'),
              subtitle: const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              ),
              trailing: const Icon(Icons.more_vert_rounded),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding:EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Lorem Ipsum'),
              subtitle: const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              ),
              trailing: const Icon(Icons.more_vert_rounded),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding:EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Lorem Ipsum'),
              subtitle: const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              ),
              trailing: const Icon(Icons.more_vert_rounded),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding:EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Lorem Ipsum'),
              subtitle: const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              ),
              trailing: const Icon(Icons.more_vert_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
