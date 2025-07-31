import 'package:flutter/material.dart';
import "package:country_flags/country_flags.dart";
import "package:lg_tribe/Controller/registration_controller_class.dart";
import "package:lg_tribe/Homepage/Screens/Profile%20Page/profile.dart";
import "package:lg_tribe_client/lg_tribe_client.dart";

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user;

 @override
  void initState() {
    super.initState();
    // Asynchronously load user profile
    () async {
      final userProfile = await client.userEndpoints.getUserProfile(
        contacts: RegistrationController.to.phoneNumber.value,
      );
      setState(() => user = userProfile );
    }();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              //Profile Picture
              CircleAvatar(
                radius: 40,
                // backgroundImage: NetworkImage(
                //   'https://example.com/profile.jpg',
                // ),
              ),
              // DecoratedBox(
              //   decoration: BoxDecoration(
              //     color: Colors.green,
              //     shape: BoxShape.circle,
              //     border: Border.all(color: Colors.white, width: 3),
              //   ),
              //   child: SizedBox(width: 20, height: 20),
              // ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //UserName
                    Text(
                      "${user!.firstName} ${user!.lastName}",
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        //Country Fag
                        CountryFlag.fromCountryCode(
                          "KE",
                          height: 20, // Set height
                          width:
                              30, // Set width if you want a rectangular flag, optional
                        ),
                        const SizedBox(width: 5),
                        //Country Name
                        const Text(
                          'Kenya, East Africa',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Profile()),
                            );
                          },
                          icon: Icon(
                            Icons.more_vert_rounded,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          //Posts
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              padding: const EdgeInsets.all(8),
              children: List.generate(12, (index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://picsum.photos/200?image=${index + 24}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
