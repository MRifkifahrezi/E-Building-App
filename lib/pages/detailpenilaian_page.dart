// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class DetailPenilaianPage extends StatelessWidget {
  const DetailPenilaianPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Penilaian'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Info Profile',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            _buildProfileCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Card(
      elevation: 5,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileInfo('Nama Lengkap', 'Muhammad Rifki Fahrezi'),
                  _buildProfileInfo('Tanggal Lahir', '11 / 10 / 2001'),
                  _buildProfileInfo('Posisi', 'Multimedia'),
                  _buildProfileInfo('Penyedia', 'PT. Alfira Putra Mandiri'),
                ],
              ),
            ),
            // const SizedBox(width: 20), // Added spacing between profile cards
            // Expanded(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       _buildProfileInfo('Nama Lengkap', 'Diana Nur'),
            //       _buildProfileInfo('Tanggal Lahir', '15 / 08 / 1995'),
            //       _buildProfileInfo('Posisi', 'Taman'),
            //       _buildProfileInfo('Penyedia', 'PT. Hijau Berseri'),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
