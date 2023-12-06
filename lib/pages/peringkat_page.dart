// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class PeringkatPage extends StatefulWidget {
  const PeringkatPage({super.key});

  @override
  _PeringkatPageState createState() => _PeringkatPageState();
}

class _PeringkatPageState extends State<PeringkatPage> {
  // Data dummy, Anda dapat menggantinya dengan data aktual dari sumber Anda.
  List<Map<String, String>> data = [
    {
      'nomor': '1',
      'tanggal': '01 Januari 2023',
      'jam_input': '09:30', // Tambahkan informasi jam input
      'nama': 'Muhammad Rifki Fahrezi',
      'posisi': 'Cleaning Service',
      'penyedia': 'PT. Alfira Putra Mandiri',
    },
    {
      'nomor': '2',
      'tanggal': '02 Januari 2023',
      'jam_input': '11:45', // Tambahkan informasi jam input
      'nama': 'Muhammad Haekal',
      'posisi': 'Security',
      'penyedia': 'PT. Alfira Putra Mandiri',
    },
    {
      'nomor': '3',
      'tanggal': '03 Januari 2023',
      'jam_input': '13:20', // Tambahkan informasi jam input
      'nama': 'Putri Lestari',
      'posisi': 'Taman',
      'penyedia': 'PT. Hijau Indah',
    },
    // Tambahkan data lain sesuai kebutuhan
  ];

  // Filter
  String selectedMonth = 'Semua Bulan';
  String selectedPosition = 'Semua Posisi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peringkat Penilaian'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Filter
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton<String>(
                  value: selectedMonth,
                  onChanged: (String? value) {
                    setState(() {
                      selectedMonth = value!;
                    });
                  },
                  items: [
                    'Semua Bulan',
                    'Januari',
                    'Februari',
                    'Maret',
                    'April',
                    'Mei',
                    'Juni',
                    'Juli',
                    'Agustus',
                    'September',
                    'Oktober',
                    'November',
                    'Desember',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: selectedPosition,
                  onChanged: (String? value) {
                    setState(() {
                      selectedPosition = value!;
                    });
                  },
                  items: [
                    'Semua Posisi',
                    'Cleaning Service',
                    'Taman',
                    'Banquet',
                    'Multimedia',
                    'Security',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Implementasi pencarian berdasarkan filter
                    // Misalnya, panggil fungsi untuk melakukan pencarian
                  },
                ),
              ],
            ),
            // ListView card
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Text(
                          '${index + 1}'), // Tambahkan nomor peringkat di sini
                      title: Text(
                          '${data[index]['tanggal']} - ${data[index]['jam_input']}'),

                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${data[index]['nama']}'),
                          Text('${data[index]['posisi']}'),
                          Text('${data[index]['penyedia']}'),
                        ],
                      ),
                      trailing: const Icon(Icons.touch_app),
                      onTap: () {
                        // Tampilkan pop-up dengan temuan kartu kuning
                        _showPopup('Temuan Kartu Kuning : 10 Kartu Kuning');
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method untuk menampilkan pop-up
  Future<void> _showPopup(String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Informasi'),
          content: Text(message),
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
}
