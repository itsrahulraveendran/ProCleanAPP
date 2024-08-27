import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proclean_app/Screens/page2_WelcomePage.dart';

class procleanFlash extends StatefulWidget {
  const procleanFlash({super.key});

  @override
  State<procleanFlash> createState() => _procleanFlashState();
}

  class _procleanFlashState extends State<procleanFlash> {

    void initState() {
      super.initState();
      Future.delayed( const Duration (seconds: 3), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WelcomePage2()));
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 200,
                alignment: Alignment.center,
                // color: Colors.cyan,
                child: Image.asset('assets/images/logo_bg.png'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
