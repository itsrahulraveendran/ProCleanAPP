import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtpSucces extends StatelessWidget {
  const OtpSucces({super.key});

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
                child: Image.asset('assets/images/checked.png',height: 150,width: 150,),
              ),
              Text("Congratulations! You have been successfully authenticated")
            ],
          ),
        ),),
    );
  }
}
