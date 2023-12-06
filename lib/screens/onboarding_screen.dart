// ignore_for_file: unnecessary_const, avoid_print, sort_child_properties_last, deprecated_member_use, prefer_const_constructors, unnecessary_string_escapes

import 'package:building_app/values/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    super.initState();
  }

  Widget _buildImage(String assetName, [double width = 200]) {
    return Image.asset('assets/onboarding/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      imagePadding: EdgeInsets.zero,
      boxDecoration: BoxDecoration(
        color: Colors.white,
      ),
    );

  
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      pages: [
        PageViewModel(
          title: "Kementerian Kesehatan",
          body:
              "Kementerian Kesehatan Republik Indonesia (Kemenkes RI) adalah kementerian dalam Pemerintah Indonesia yang membidangi urusan kesehatan.",
          image: _buildImage('icon-kemenkes.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Biro Umum",
          body:
              "Biro Umum Sekretariat Jenderal merupakan Unit Organisasi setingkat Eselon II di Kementerian Kesehatan yang mempunyai tugas dan fungsi sesuai Peraturan Menteri Kesehatan Republik Indonesia Nomor 5 Tahun 2022 tentang Organisasi dan Tata Kerja Kementerian Kesehatan yaitu melaksanakan urusan ketatausahaan Sekretaris Jenderal, pengelolaan kerumahtanggaan, dan kearsipan Kementerian.",
          image: _buildImage('CARE-1024x576.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "E-Building",
          body:
              " E-Building adalah Aplikasi dan Website untuk melakukan penilaian kinerja karyawan.",
          image: _buildImage('logo-ebuilding.png'),
          footer: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.loginScreen);
              },
              child: const Text(
                'LogIn',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(55), // NEW
                primary: Color.fromARGB(255, 32, 197, 164),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          decoration: pageDecoration,
        ),
      ],
      showSkipButton: false,
      showDoneButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      back: const Text('Back',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 32, 197, 164))),
      next: const Text('Next',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 32, 197, 164))),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(8.0, 8.0),
        color: Color.fromARGB(255, 255, 255, 255),
        activeSize: Size(15.0, 5.0),
        activeColor: Color.fromARGB(255, 32, 197, 164),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
