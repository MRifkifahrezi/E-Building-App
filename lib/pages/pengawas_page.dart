// ignore_for_file: library_private_types_in_public_api, prefer_const_literals_to_create_immutables, unnecessary_const, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

class PengawasPage extends StatefulWidget {
  const PengawasPage({Key? key}) : super(key: key);

  @override
  _PengawasPageState createState() => _PengawasPageState();
}

class _PengawasPageState extends State<PengawasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pengawas'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(9.5),
          child: Column(
            children: [
              Row(
                children: [
                  DropdownButton<String>(
                    hint: const Text('Semua Bulan'),
                    items: <String>[
                      'Januari',
                      'Februari',
                      'Maret',
                      'April',
                      'May',
                      'Juni',
                      'Juli',
                      'Agustus',
                      'September',
                      'Oktober',
                      'November',
                      'Desember'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      // Handle filter bulan change
                    },
                  ),
                  DropdownButton<String>(
                    hint: const Text('Semua Area'),
                    items: <String>[
                      'Adhyatma Lantai 3',
                      'Sujudi Lantai 4',
                      'P9',
                      'Sujudi Lantai 5',
                      'Adhyatma Lantai 6'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      // Handle filter bulan change
                    },
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 55,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          4), // Adjust the border radius as needed
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle search button click
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero, // Remove default padding
                        ),
                        child: Icon(Icons.search),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    const DataColumn(
                      label: SizedBox(width: 50, child: Text('No')),
                    ),
                    const DataColumn(
                      label: SizedBox(width: 120, child: Text('Nama Pengawas')),
                    ),
                    const DataColumn(
                      label: SizedBox(width: 120, child: Text('Jenis Kelamin')),
                    ),
                    const DataColumn(
                      label: SizedBox(width: 50, child: Text('Usia')),
                    ),
                    const DataColumn(
                      label: SizedBox(width: 100, child: Text('No. HP')),
                    ),
                    const DataColumn(
                      label: SizedBox(width: 100, child: Text('Area Pengawas')),
                    ),
                    const DataColumn(
                      label: SizedBox(width: 150, child: Text('Action')),
                    ),
                  ],
                  rows: [
                    DataRow(cells: [
                      const DataCell(Text('1')),
                      const DataCell(Text('John Doe')),
                      const DataCell(Text('Laki-laki')),
                      const DataCell(Text('30')),
                      const DataCell(Text('08123456789')),
                      const DataCell(Text('Area 1')),
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8), // Adjust the horizontal padding
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Handle Edit button click
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent[100],
                                ),
                                child: Icon(
                                  Icons.dehaze, // Replace with the desired icon
                                  color: Colors.black, // Set the icon color
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle Edit button click
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellowAccent[100],
                                ),
                                child: Icon(
                                  Icons.edit, // Replace with the desired icon
                                  color: Colors.black, // Set the icon color
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle Delete button click
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent[100],
                                ),
                                child: Icon(
                                  Icons.delete, // Replace with the desired icon
                                  color: Colors.black, // Set the icon color
                                ), // Replace "Delete" text with a delete icon
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('2')),
                      const DataCell(Text('John Doe')),
                      const DataCell(Text('Laki-laki')),
                      const DataCell(Text('30')),
                      const DataCell(Text('08123456789')),
                      const DataCell(Text('Area 1')),
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8), // Adjust the horizontal padding
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Handle Edit button click
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent[100],
                                ),
                                child: Icon(
                                  Icons.dehaze, // Replace with the desired icon
                                  color: Colors.black, // Set the icon color
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle Edit button click
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellowAccent[100],
                                ),
                                child: Icon(
                                  Icons.edit, // Replace with the desired icon
                                  color: Colors.black, // Set the icon color
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle Delete button click
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent[100],
                                ),
                                child: Icon(
                                  Icons.delete, // Replace with the desired icon
                                  color: Colors.black, // Set the icon color
                                ), // Replace "Delete" text with a delete icon
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('3')),
                      const DataCell(Text('John Doe')),
                      const DataCell(Text('Laki-laki')),
                      const DataCell(Text('30')),
                      const DataCell(Text('08123456789')),
                      const DataCell(Text('Area 1')),
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8), // Adjust the horizontal padding
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Handle Edit button click
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent[100],
                                ),
                                child: Icon(
                                  Icons.dehaze, // Replace with the desired icon
                                  color: Colors.black, // Set the icon color
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle Edit button click
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellowAccent[100],
                                ),
                                child: Icon(
                                  Icons.edit, // Replace with the desired icon
                                  color: Colors.black, // Set the icon color
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle Delete button click
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent[100],
                                ),
                                child: Icon(
                                  Icons.delete, // Replace with the desired icon
                                  color: Colors.black, // Set the icon color
                                ), // Replace "Delete" text with a delete icon
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('4')),
                      const DataCell(Text('John Doe')),
                      const DataCell(Text('Laki-laki')),
                      const DataCell(Text('30')),
                      const DataCell(Text('08123456789')),
                      const DataCell(Text('Area 1')),
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8), // Adjust the horizontal padding
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Handle Edit button click
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent[100],
                                ),
                                child: Icon(
                                  Icons.dehaze, // Replace with the desired icon
                                  color: Colors.black, // Set the icon color
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle Edit button click
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellowAccent[100],
                                ),
                                child: Icon(
                                  Icons.edit, // Replace with the desired icon
                                  color: Colors.black, // Set the icon color
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle Delete button click
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent[100],
                                ),
                                child: Icon(
                                  Icons.delete, // Replace with the desired icon
                                  color: Colors.black, // Set the icon color
                                ), // Replace "Delete" text with a delete icon
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('5')),
                      const DataCell(Text('John Doe')),
                      const DataCell(Text('Laki-laki')),
                      const DataCell(Text('30')),
                      const DataCell(Text('08123456789')),
                      const DataCell(Text('Area 1')),
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8), // Adjust the horizontal padding
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Handle Edit button click
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent[100],
                                ),
                                child: Icon(
                                  Icons.dehaze, // Replace with the desired icon
                                  color: Colors.black, // Set the icon color
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle Edit button click
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellowAccent[100],
                                ),
                                child: Icon(
                                  Icons.edit, // Replace with the desired icon
                                  color: Colors.black, // Set the icon color
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle Delete button click
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent[100],
                                ),
                                child: Icon(
                                  Icons.delete, // Replace with the desired icon
                                  color: Colors.black, // Set the icon color
                                ), // Replace "Delete" text with a delete icon
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('6')),
                      const DataCell(Text('John Doe')),
                      const DataCell(Text('Laki-laki')),
                      const DataCell(Text('30')),
                      const DataCell(Text('08123456789')),
                      const DataCell(Text('Area 1')),
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8), // Adjust the horizontal padding
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Handle Edit button click
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent[100],
                                ),
                                child: Icon(
                                  Icons.dehaze, // Replace with the desired icon
                                  color: Colors.black, // Set the icon color
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle Edit button click
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellowAccent[100],
                                ),
                                child: Icon(
                                  Icons.edit, // Replace with the desired icon
                                  color: Colors.black, // Set the icon color
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle Delete button click
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent[100],
                                ),
                                child: Icon(
                                  Icons.delete, // Replace with the desired icon
                                  color: Colors.black, // Set the icon color
                                ), // Replace "Delete" text with a delete icon
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                    // Add more rows as needed
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: PengawasPage(),
  ));
}
