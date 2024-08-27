import 'package:flutter/material.dart';
import 'package:proclean_app/Screens/Page10_Search.dart';
import 'package:proclean_app/Screens/Page8_HomePage.dart';
import 'package:proclean_app/Screens/page1_flashscreen.dart';
import 'package:proclean_app/Screens/page2_WelcomePage.dart';


import '../Screenvendor/page1_vendorUpload.dart';
import 'Page3_loginPage.dart';
import 'Page4_SignUp.dart';
import 'Page5_OtpVerification.dart';
import 'Page6_OtpEnter.dart';
import 'Page7_OtpSucces.dart';
import 'NavBAR.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // home:procleanFlash(),
      home:procleanFlash(),
    );
  }
}

