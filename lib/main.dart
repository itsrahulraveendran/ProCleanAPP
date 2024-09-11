import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proclean_app/Screens/Page10_Search.dart';
import 'package:proclean_app/Screens/Page8_HomePage.dart';
import 'package:proclean_app/Screens/login_signin/page1_flashscreen.dart';
import 'package:proclean_app/Screens/login_signin/page2_WelcomePage.dart';
import 'package:proclean_app/image_Store/ui_image_upload.dart';


import 'Screens/Products/Page11_Chemical.dart';
import 'Seller//page1_vendorUpload.dart';
import 'firebase_options.dart';
import 'Screens/login_signin/Page3_loginPage.dart';
import 'Screens/login_signin/Page4_SignUp.dart';
import 'Screens/login_signin/Page5_OtpVerification.dart';
import 'Screens/login_signin/Page6_OtpEnter.dart';
import 'Screens/login_signin/Page7_OtpSucces.dart';
import 'Screens/NavBAR.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home:procleanFlash(),
      // home:procleanFlash(),
      // home:AddItem(),
    );
  }
}

