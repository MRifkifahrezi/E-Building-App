// ignore_for_file: library_private_types_in_public_api

import 'package:building_app/pages/Kriteriapenilaian_page.dart';
import 'package:flutter/material.dart';

class PenilaianPage extends StatefulWidget {
  const PenilaianPage({super.key});

  @override
  _PenilaianPageState createState() => _PenilaianPageState();
}

class _PenilaianPageState extends State<PenilaianPage> {
  String? selectedPosisi;
  String? selectedPegawai;
  String? selectedAreaKerja;

  List<String> posisiList = [
    "Cleaning Service",
    "Taman",
    "Banquet",
    "Multimedia",
    "Security",
  ]; // Gantilah dengan data yang sesuai
  List<String> pegawaiList = [
    "Yanto Gan",
    "Tono Han",
    "Anton Jan"
  ]; // Gantilah dengan data yang sesuai
  List<String> areaKerjaList = [
    "Dr. Sujudi",
    "Dr. Adhyatma",
    "Sarana Penunjang"
  ]; // Gantilah dengan data yang sesuai

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pegawai'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Bagian Formulir Penilaian
            Expanded(
              child: Column(
                children: [
                  // Posisi Pegawai
                  DropdownButtonFormField<String>(
                    value: selectedPosisi,
                    onChanged: (value) {
                      setState(() {
                        selectedPosisi = value;
                      });
                    },
                    items: posisiList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      labelText: 'Posisi Pegawai*',
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Bagian yang ditampilkan saat 'posisi_id' terpilih
                  if (selectedPosisi != null && selectedPosisi != "")
                    Column(
                      children: [
                        // Nama Pegawai
                        DropdownButtonFormField<String>(
                          value: selectedPegawai,
                          onChanged: (value) {
                            setState(() {
                              selectedPegawai = value;
                            });
                          },
                          items: pegawaiList.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                            labelText: 'Nama Pegawai*',
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Area Kerja
                        DropdownButtonFormField<String>(
                          value: selectedAreaKerja,
                          onChanged: (value) {
                            setState(() {
                              selectedAreaKerja = value;
                            });
                          },
                          items: areaKerjaList.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                            labelText: 'Area Kerja*',
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Tombol Next
                        ElevatedButton(
                          onPressed: () {
                            // Navigasi ke halaman KriteriaPenilaianPage.dart
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const KriteriaPenilaianPage()),
                            );
                          },
                          child: const Text('Mulai Penilaian'),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
