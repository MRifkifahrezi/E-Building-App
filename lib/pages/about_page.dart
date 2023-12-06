import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Mobile E-building'),
      ),
      body: const Expanded(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat Datang di E-building Mobile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Tentang Mobile E-building:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'E-building adalah aplikasi mobile dan website yang dirancang untuk melakukan penilaian kinerja Pegawai. Aplikasi ini memberikan kemudahan bagi perusahaan untuk mengelola dan memonitor performa karyawan secara efektif.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Fitur E-Building Mobile:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '- Penilaian: E-building memungkinkan Supervisor untuk memberikan penilaian kinerja Pegawai dengan mudah dan transparan.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Area Kerja: Untuk Mengetahui Pegawai bekerja di sektor atau area',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Daftar Pegawai: Untuk mengetahui Identitas Pegawai .',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Daftar Pengawas: Untuk mengetahui Identitas Pengawas yang sebagai Supervisor .',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- MyAssesment : Untuk mengetahui hasil kinerja pegawai yang ditemukan Kartu Kuning.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Peringkat: Untuk mengetahui kinerja pegawai dalam sistem ranking (dari yang sedikit ke terbanyak).',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'E-Building Mobile Version:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Version 1.0.0.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Kami Juga Hadir di Website https://e-building.site/',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Kami berharap E-building dapat membantu perusahaan Anda dalam mengelola dan meningkatkan produktivitas Pegawai. Terima kasih telah menggunakan aplikasi kami!',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
