import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proclean_app/Screens/Page7_OtpSucces.dart';

class OtpEnter extends StatelessWidget {
  const OtpEnter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/Logo_procleaner_v.png',
          fit: BoxFit.contain,
          height: 72,
        ),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              SizedBox(height: 70,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    alignment: Alignment.centerLeft,
                   child: const Text(

                  "Verification Code",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(

                    "We have sent the verification code to your Mobile Number",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //Text Form

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter OTP",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          fixedSize: Size(350, 40),
                        ),
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const OtpSucces()));},
                        child: const Text(
                          "Confirm",
                          style: TextStyle(color: Colors.white),
                        )),



                  ],
                ),
              )
            ],
          ),
        ),
      ),);
  }
}
