// ignore_for_file: library_private_types_in_public_api

import 'package:building_app/pages/detailpenilaian_page.dart';
import 'package:flutter/material.dart';

class MyAssessmentPage extends StatefulWidget {
  const MyAssessmentPage({Key? key, required Map<String, bool> checkedKriteria})
      : super(key: key);

  @override
  _MyAssessmentPageState createState() => _MyAssessmentPageState();
}

class _MyAssessmentPageState extends State<MyAssessmentPage> {
  // Data dummy untuk daftar penilaian
  List<Map<String, String>> assessments = [
    {
      'tanggal': '01 Januari 2023',
      'nama': 'Muhammad Rifki Fahrezi',
      'posisi': 'Cleaning Service',
      'penyedia': 'PT. Alfira Putra Mandiri',
    },
    {
      'tanggal': '02 Januari 2023',
      'nama': 'Muhammad Rizky Ar Rasyid',
      'posisi': 'Cleaning Service',
      'penyedia': 'PT. Alfira Putra Mandiri',
    },
    {
      'tanggal': '03 Januari 2023',
      'nama': 'Muhammad Haekal',
      'posisi': 'Cleaning Service',
      'penyedia': 'PT. Alfira Putra Mandiri',
    },
    {
      'tanggal': '04 Januari 2023',
      'nama': 'Khammarul Fattah',
      'posisi': 'Cleaning Service',
      'penyedia': 'PT. Alfira Putra Mandiri',
    },
    {
      'tanggal': '05 Januari 2023',
      'nama': 'Galih Chandra',
      'posisi': 'Cleaning Service',
      'penyedia': 'PT. Alfira Putra Mandiri',
    },
    {
      'tanggal': '06 Januari 2023',
      'nama': 'Calvin Febriansyah',
      'posisi': 'Cleaning Service',
      'penyedia': 'PT. Alfira Putra Mandiri',
    },
    {
      'tanggal': '07 Januari 2023',
      'nama': 'Rahmat Azhar',
      'posisi': 'Cleaning Service',
      'penyedia': 'PT. Alfira Putra Mandiri',
    },
    {
      'tanggal': '08 Januari 2023',
      'nama': 'Ananda Ilyasa',
      'posisi': 'Cleaning Service',
      'penyedia': 'PT. Alfira Putra Mandiri',
    },
    {
      'tanggal': '09 Januari 2023',
      'nama': 'Filipi Fushika',
      'posisi': 'Cleaning Service',
      'penyedia': 'PT. Alfira Putra Mandiri',
    },
    {
      'tanggal': '10 Januari 2023',
      'nama': 'Muhammad Thoriq',
      'posisi': 'Cleaning Service',
      'penyedia': 'PT. Alfira Putra Mandiri',
    },
    // Tambahkan data dummy lainnya sesuai kebutuhan
  ];

  // Filter
  String selectedMonth = 'Semua Bulan';
  String selectedPosition = 'Semua Posisi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Assessment'),
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
            // Daftar Penilaian
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: assessments.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Tanggal: ${assessments[index]['tanggal']}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nama: ${assessments[index]['nama']}'),
                          Text('Posisi: ${assessments[index]['posisi']}'),
                          Text('Penyedia: ${assessments[index]['penyedia']}'),
                        ],
                      ),
                      trailing: PopupMenuButton<String>(
                        itemBuilder: (BuildContext context) {
                          return [
                            'Detail',
                            'Edit',
                            'Delete',
                          ].map((String choice) {
                            IconData? icon; // Declare as nullable IconData

                            if (choice == 'Detail') {
                              icon = Icons
                                  .info_outline; // Ganti dengan ikon yang sesuai untuk Detail
                            } else if (choice == 'Edit') {
                              icon = Icons
                                  .edit; // Ganti dengan ikon yang sesuai untuk Edit
                            } else if (choice == 'Delete') {
                              icon = Icons
                                  .delete; // Ganti dengan ikon yang sesuai untuk Delete
                            }

                            // Ensure icon has a non-null value
                            if (icon != null) {
                              return PopupMenuItem<String>(
                                value: choice,
                                child: Row(
                                  children: [
                                    Icon(icon),
                                    const SizedBox(width: 8.0),
                                    Text(choice),
                                  ],
                                ),
                              );
                            } else {
                              // Handle the case where icon is null (optional)
                              return PopupMenuItem<String>(
                                value: choice,
                                child: Text(choice),
                              );
                            }
                          }).toList();
                        },
                        onSelected: (value) {
                          if (value == 'Detail') {
                            // Navigasi ke halaman DetailPenilaianPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const DetailPenilaianPage(),
                              ),
                            );
                          } else if (value == 'Edit') {
                            // Implementasi aksi edit
                          } else if (value == 'Delete') {
                            // Implementasi aksi hapus
                          }
                        },
                      ),
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
}
