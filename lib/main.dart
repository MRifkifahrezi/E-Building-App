// ignore: depend_on_referenced_packages
// ignore_for_file: prefer_const_constructors, unused_import
import 'package:building_app/pages/Editprofile_page.dart';
import 'package:building_app/pages/Kriteriapenilaian_page.dart';
import 'package:building_app/pages/dashboard_page.dart';
import 'package:building_app/pages/detailpenilaian_page.dart';
import 'package:building_app/pages/myassesment_page.dart';
import 'package:building_app/pages/pegawai_page.dart';
import 'package:building_app/pages/pengawas_page.dart';
import 'package:building_app/pages/penilaian_page.dart';
import 'package:building_app/pages/peringkat_page.dart';
import 'package:building_app/pages/profile_page.dart';
import 'package:building_app/pages/welcome_page.dart';
import 'package:building_app/pages/login_page.dart';
import 'package:building_app/screens/onboarding_screen.dart';
import 'package:building_app/values/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Building',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingScreen(),
      initialRoute: AppRoutes.onboardingScreen,
      routes: {
        AppRoutes.onboardingScreen: (context) => OnboardingScreen(),
        AppRoutes.loginScreen: (context) => LoginPage(),
        AppRoutes.welcomeScreen: (context) => WelcomeScreen(),
        AppRoutes.penilaianScreen: (context) => PenilaianPage(),
        AppRoutes.pegawaiScreen: (context) => PegawaiPage(),
        AppRoutes.profileScreen: (context) => ProfilePage(),
        AppRoutes.editprofileScreen: (context) => EditProfilePage(),
        AppRoutes.pengawasScreen: (context) => PengawasPage(),
        AppRoutes.kriteriapenilaianScreen: (context) => KriteriaPenilaianPage(),
        AppRoutes.myassesmentScreen: (context) => MyAssessmentPage(checkedKriteria: const {},),
        AppRoutes.peringkatScreen: (context) => PeringkatPage(),
        AppRoutes.dashboardScreen: (context) => DashboardPage(),
        AppRoutes.detailpenilaianScreen: (context) => DetailPenilaianPage(),
        // Tambahkan rute-rute lain jika diperlukan
      },
    );
  }
}
