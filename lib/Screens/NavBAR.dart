import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proclean_app/Widgets/1_HomePage.dart';
import 'package:proclean_app/Widgets/2_ServicePageNavbar.dart';
import 'package:proclean_app/Widgets/3_Carwash.dart';
import 'package:proclean_app/Widgets/4_ProfileNavbar.dart';
import 'package:proclean_app/Widgets/5_Cart.dart';

class landingPage extends StatefulWidget {
  const landingPage({super.key});

  @override
  State<landingPage> createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  int indexNum = 0;
  List tabwidget = [
    HomeScreen(),
    ServiceScreen(),
    CartScreen(),
    CarWashScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // backgroundColor: Colors.green[200],
      //   backgroundColor: const Color(0xffDCDCDC),
      //   title: Image.asset(
      //     'assets/images/Logo_procleaner_v.png',
      //     fit: BoxFit.contain,
      //     height: 72,
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(
      //         Icons.search,
      //         color: Colors.black,
      //       ),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 70,
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  size: 30,
                  // color: Colors.black,
                  Icons.home_outlined,
                ),
                label: "home",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  size: 30,
                  // color: Colors.black,
                  Icons.cleaning_services,
                ),
                label: "shop",
                backgroundColor: Colors.white),

            BottomNavigationBarItem(
                icon: Icon(
                  size: 30,
                  // color: Colors.black,
                  Icons.local_car_wash_outlined,
                ),
                label: "Profile",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  // color: Colors.black,
                  Icons.shopping_cart_outlined,
                ),
                label: "Cart",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  size: 30,
                  // color: Colors.black,
                  Icons.person_2_outlined,
                ),
                label: "Profile",
                backgroundColor: Colors.white),

          ],
          selectedItemColor:
              Colors.blueAccent, // Set color for the selected item
          unselectedItemColor: Colors.grey, // Set color for unselected items
          backgroundColor: Colors.white,

          currentIndex: indexNum,
          onTap: (int index){setState(() {
indexNum = index;
          });},
        ),
      ),
      body: tabwidget[indexNum],
    );
  }
}
