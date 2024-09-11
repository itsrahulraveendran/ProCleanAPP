import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Page3_loginPage.dart';

class WelcomePage2 extends StatelessWidget {
  const WelcomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              // color: Colors.green,
              alignment: Alignment.center,
              child: Image.asset('assets/images/female.png'),
            ),
            const Text(
              "Team work all",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                "Experience top-tier cleaning services with our dedicated team, ensuring every corner of your home or office sparkles with pristine cleanliness and unmatched attention to detail.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(140, 60),
                        backgroundColor:Colors.black,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                topRight: Radius.zero,
                                bottomRight: Radius.zero,))),
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));},
                    child: const Text('Sign In',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(140, 60),
                        backgroundColor: const Color(0xffE92F48),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.zero,
                                bottomLeft: Radius.zero,
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)))),
                    onPressed: () {},
                    child: const Text('Register',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
