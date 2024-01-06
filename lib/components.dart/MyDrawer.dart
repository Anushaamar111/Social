import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void Logout() {
    if (FirebaseAuth.instance.currentUser != null) {
      FirebaseAuth.instance.signOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          const DrawerHeader(
              child: Icon(
            Icons.camera_alt_outlined,
            size: 40,
          )),
          Column(
            children: [
              SizedBox(height: 25),
              ListTile(
                leading: const Icon(Icons.home_filled),
                title: const Text('H O M E'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/HomePage');
                },
              ),
              SizedBox(height: 25),
              ListTile(
                leading: const Icon(Icons.person_2_outlined),
                title: const Text('P R O F I L E'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/profile_page');
                },
              ),
              SizedBox(height: 25),
              ListTile(
                leading: const Icon(Icons.people_alt_outlined),
                title: const Text('F R I E N D S'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/User');
                },
              ),
            ],
          ),
          const SizedBox(height: 25),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('L O G O U T'),
            onTap: () {
              Logout();
              Navigator.pop(
                  context); // Make sure this is called before navigating
              Navigator.pushNamed(
                  context, '/Login'); // Replace with your login route
              try {
                FirebaseAuth.instance.signOut();
              } catch (e) {
                print("Logout error: $e");
              }
            },
          )
        ],
      ),
    );
  }
}
