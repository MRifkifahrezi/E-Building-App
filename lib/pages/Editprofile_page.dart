// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, library_private_types_in_public_api

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? image; // Assuming you are using the 'file' type for the image

  Future<void> openCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  Future<void> openGallery() async {
    final imageGallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageGallery != null) {
      setState(() {
        image = File(imageGallery.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 20),
        child: ListView(children: [
          Center(
            child: Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.grey, // Set the background color to gray
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: image != null
                        ? ClipOval(
                            child: Image.file(
                              image!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 50,
                            child: Icon(
                              Icons.person, // Replace with the desired icon
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 60,
                  right: 0,
                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: const Color.fromARGB(255, 32, 197, 164),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) => Container(
                                  height: 100,
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Choose Profile Photo',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextButton.icon(
                                            icon: const Icon(Icons.camera),
                                            onPressed: () {
                                              openCamera();
                                              Navigator.pop(
                                                  context); // Close the modal
                                            },
                                            label: const Text('Camera'),
                                          ),
                                          TextButton.icon(
                                            icon: const Icon(Icons.image),
                                            onPressed: () {
                                              openGallery();
                                              Navigator.pop(
                                                  context); // Close the modal
                                            },
                                            label: const Text('Gallery'),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          );
                        },
                        child: const Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 5,
            color: const Color.fromARGB(
                255, 255, 255, 255), // Set the background color to white
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProfileInfo(
                            'Nama Lengkap', 'Muhammad Rifki Fahrezi'),
                        _buildProfileInfo('Tanggal Lahir', '11 / 10 / 2001'),
                        _buildProfileInfo('Posisi', 'Multimedia'),
                        _buildProfileInfo(
                            'Penyedia', 'PT. Alfira Putra Mandiri'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add logic to navigate to the edit page
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 32, 197, 164), // Change the button color
                    ),
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.white, // Change the text color
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 5,
            color: const Color.fromARGB(
                255, 255, 255, 255), // Set the background color to white
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nomor Telephone',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextButton(
                          onPressed: () {
                            _showPhoneNumberPopup(context, '0822 1913 7003');
                          },
                          child: const Text(
                            'Lihat Nomor Telephone',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors
                                  .blue, // Set the color to indicate a link
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add logic to navigate to the edit page
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 32, 197, 164), // Change the button color
                    ),
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.white, // Change the text color
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 5,
            color: const Color.fromARGB(
                255, 255, 255, 255), // Set the background color to white
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProfileInfo('Email', 'Rifkifahrezi16@gmail.com'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add logic to navigate to the edit page
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 32, 197, 164), // Change the button color
                    ),
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.white, // Change the text color
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }

  void _showPhoneNumberPopup(BuildContext context, String phoneNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Nomor Telephone'),
          content: Text(phoneNumber),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildProfileInfo(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
