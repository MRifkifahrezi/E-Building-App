// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:building_app/pages/dashboard_page.dart';
import 'package:building_app/pages/myassesment_page.dart';
import 'package:building_app/pages/pengawas_page.dart';
import 'package:building_app/pages/peringkat_page.dart';
import 'package:flutter/material.dart';
import 'package:building_app/pages/penilaian_page.dart';
import 'package:building_app/pages/pegawai_page.dart';
import 'package:building_app/pages/profile_page.dart';

void main() {
  runApp(const MaterialApp(
    home: WelcomeScreen(),
  ));
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Hallo, Muhammad Rifki Fahrezi'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'MOBILE E-BUILDING FEATURES',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PenilaianPage(),
                    ),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 1, 250, 154),
                            Color.fromARGB(255, 32, 197, 164),
                          ],
                        ),
                      ),
                      child: const Icon(
                        Icons.assignment_turned_in,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Penilaian",
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PegawaiPage(),
                    ),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 1, 250, 154),
                            Color.fromARGB(255, 32, 197, 164),
                          ],
                        ),
                      ),
                      child: const Icon(
                        Icons.people,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Daftar Pegawai",
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PengawasPage(),
                    ),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 1, 250, 154),
                            Color.fromARGB(255, 32, 197, 164),
                          ],
                        ),
                      ),
                      child: const Icon(
                        Icons.supervised_user_circle,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Daftar Pengawas",
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Ranking Penilaian Top 5 Tahun 2023',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                // Replace the following with your actual data for ranking
                int rank = index + 1;
                String name, position, provider;

                switch (rank) {
                  case 1:
                    name = "Muhammad Rifki Fahrezi";
                    position = "Cleaning Service";
                    provider = "PT. Alfira Putra Mandiri";
                    break;
                  case 2:
                    name = "Muhammad Haekal";
                    position = "Security";
                    provider = "PT. Alfira Putra Mandiri";
                    break;
                  case 3:
                    name = "Rahmat Azhar";
                    position = "Banquet";
                    provider = "PT. Alfira Putra Mandiri";
                    break;
                  case 4:
                    name = "Muhammad Rizky";
                    position = "Cleaning Service";
                    provider = "PT. Alfira Mandiri";
                    break;
                  case 5:
                    name = "Alviana Rahmah";
                    position = "Taman";
                    provider = "PT. Alfira Putra Mandiri";
                    break;
                  default:
                    name = "";
                    position = "";
                    provider = "";
                    break;
                }

                int yellowCards = rank * 2; // Replace with actual data

                return Card(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 40,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 8),
                              Text("Peringkat $rank"),
                              const SizedBox(width: 8),
                            ],
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 8),
                              Text("Jumlah Kartu Kuning: $yellowCards"),
                            ],
                          ),
                        ),
                      );
                    },
                    splashColor: Colors.greenAccent,
                    child: ListTile(
                      title: Text("No. $rank"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nama: $name"),
                          Text("Posisi: $position"),
                          Text("Penyedia: $provider"),
                        ],
                      ),
                      trailing: const Icon(Icons.touch_app),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (_currentIndex != index) {
            setState(() {
              _currentIndex = index;
            });

            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WelcomeScreen()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyAssessmentPage(
                            checkedKriteria: const {},
                          )),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PeringkatPage()),
                );
                break;
              case 4:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
                break;
            }
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'MyAssessment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Peringkat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
          ),
        ],
        backgroundColor: Colors.transparent,
        selectedItemColor: const Color.fromARGB(255, 32, 197, 164),
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
