import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proclean_app/Screens/Page6_OtpEnter.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification({super.key});

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

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/Secure.png',width: 200,height: 200,fit: BoxFit.fill,)
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(

                    "Secure your access with a quick OTP",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //Text Form

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Mobile Number",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          fixedSize: Size(350, 40),
                        ),
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const OtpEnter()));},
                        child: Text(
                          "Send OTP",
                          style: TextStyle(color: Colors.white),
                        )),



                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
