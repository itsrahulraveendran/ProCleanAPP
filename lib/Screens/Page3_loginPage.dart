import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proclean_app/Screens/Page4_SignUp.dart';
import 'package:proclean_app/Screens/Page5_OtpVerification.dart';
import 'package:proclean_app/Screens/Page8_HomePage.dart';

import 'NavBAR.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Lets Sign you in",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome Back, You have been missed",
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
                          hintText: "User Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 5,
                          ),
                        ),
                      ),
                    ),
                    TextButton(onPressed: () {}, child: Text('Forgot Password')),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          fixedSize: Size(350, 40),
                        ),
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const landingPage()));},
                        child: Text(
                          "LogIn",
                          style: TextStyle(color: Colors.white),
                        )),
                    SizedBox(height: 20,),

                    
                    
                    Text("Or",style: TextStyle(fontWeight: FontWeight.bold),),

                    // Row(
                    //   children: [
                    //     Container(
                    //         height: 10,
                    //         width: 180,
                    //         child: Divider(
                    //           color: Colors.black,
                    //           thickness: 2,
                    //         )),
                    //     Container(height: 20, width: 20, child: Text(" or")),
                    //     Container(
                    //         height: 10,
                    //         width: 180,
                    //         child: Divider(
                    //           thickness: 2,
                    //           color: Colors.black,
                    //         ))
                    //   ],
                    // ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon:Image.asset('assets/images/facebook.png',width: 30,height: 30,),
                            ),
                        IconButton(
                          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const OtpVerification()));},
                          icon: Image.asset('assets/images/otp.png',width: 30,height: 30,),
                        ),
                        IconButton(
                            onPressed: () {}, icon:Image.asset('assets/images/google_logo.png',width: 30,height: 30,)),

                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Dont have an account?"),
                        TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpPage()));}, child: Text("Register"))
                      ],
                    )
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
