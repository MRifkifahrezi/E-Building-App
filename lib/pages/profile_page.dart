// ignore_for_file: use_key_in_widget_constructors

import 'package:building_app/pages/Editprofile_page.dart';
import 'package:building_app/pages/about_page.dart';
import 'package:building_app/pages/login_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile,'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: ListTile(
                leading: const Icon(
                  Icons.account_circle_rounded,
                  size: 40, // Sesuaikan ukuran ikon sesuai kebutuhan
                ),
                title: const Text(
                  'Muhammad Rifki Fahrezi',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.phone),
                        SizedBox(width: 8.0),
                        Text('082219137003'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(width: 8.0),
                        Text('Security'),
                      ],
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    // Navigasi ke halaman EditProfilePage.dart
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfilePage()),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Card(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: ListTile(
                leading: const Icon(Icons.info),
                title: const Text('About'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutPage()),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            Card(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
