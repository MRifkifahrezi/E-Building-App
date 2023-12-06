// ignore_for_file: file_names, library_private_types_in_public_api, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class KriteriaPenilaianPage extends StatefulWidget {
  const KriteriaPenilaianPage({Key? key}) : super(key: key);

  @override
  _KriteriaPenilaianPageState createState() => _KriteriaPenilaianPageState();
}

class _KriteriaPenilaianPageState extends State<KriteriaPenilaianPage> {
  List<String> kriteria = [
    'Area Kotor dan Berdebu',
    'Bau Tidak Sedap',
    'Tidak Ada Warning Sign saat Pengepelan (Mopping)',
    'Ditemukan Jentik dalam Tempat Penampungan Air',
    'Ditemukan Noda pada Dinding, Kaca, dan Plafon',
  ];

  Map<String, bool> checkedKriteria = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kriteria Penilaian'),
      ),
      body: ListView.builder(
        itemCount: kriteria.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.touch_app_outlined),
              title: Text(kriteria[index]),
              trailing: Checkbox(
                value: checkedKriteria[kriteria[index]] ?? false,
                onChanged: (value) {
                  setState(() {
                    checkedKriteria[kriteria[index]] = value!;
                  });
                },
              ),
              onTap: () {
                _showPopup(kriteria[index]);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _simpanData(); // Replace with your logic to save data
        },
        child: const Icon(Icons.save),
      ),
    );
  }

  void _simpanData() {
    // Implement your logic to save data here
    // For now, let's print a message indicating that the data is saved.
    print('Data disimpan: $checkedKriteria');
  }

  void _showPopup(String kriteria) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Kriteria: $kriteria'),
          content: Column(
            children: [
              // Ganti ElevatedButton dengan ElevatedButton.icon untuk membuka kamera
              ElevatedButton.icon(
                onPressed: () {
                  _openCamera();
                },
                icon: const Icon(Icons.camera),
                label: const Text('Open Kamera'),
              ),
              ElevatedButton(
                onPressed: () {
                  _showNotePopup(kriteria);
                },
                child: const Text('Catatan'),
              ),
            ],
          ),
          // Atur padding konten agar pop-up bisa mengecil sesuai dengan ukuran kontennya
          contentPadding: const EdgeInsets.all(16.0),
        );
      },
    );
  }

  void _openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Tampilkan gambar yang diambil dari kamera
      _showImagePreview(File(pickedFile.path));
    } else {
      print('Pengambilan gambar dari kamera dibatalkan');
    }
  }

  void _showImagePreview(File imageFile) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Gambar dari Kamera'),
          content: Column(
            children: [
              Image.file(imageFile),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, // Untuk menyusun tombol secara horizontal
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Tutup'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implementasi logika simpan gambar
                      Navigator.of(context).pop();
                    },
                    child: const Text('Simpan'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showNotePopup(String kriteria) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Catatan - Kriteria: $kriteria'),
          content: Column(
            children: [
              const TextField(
                maxLines: 6,
                decoration: InputDecoration(
                  hintText:
                      'Keterangan Tidak boleh subjektif! Contoh : Area Kotor dan berdebu pada sudut WC',
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, // Untuk menyusun tombol secara horizontal
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Implementasi simpan catatan
                    },
                    child: const Text('Batal'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Simpan'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void main() {
    runApp(const MaterialApp(
      home: KriteriaPenilaianPage(),
    ));
  }
}
