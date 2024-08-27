import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

    Widget buildCategoryCard(String title, String imagePath) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 105,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              // color: Colors.black.withOpacity(1),
              color: const Color(0xffE92F48),
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      );
    }

    Widget buildServiceProduct(String CompanyName, String Subtitle,
        String ProductImage, int price) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 250,
          height: 230,
          decoration: BoxDecoration(
            color: Color(0xff407981),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(ProductImage),
                              fit: BoxFit.cover)),
                    ),
                    Text(
                      CompanyName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    Subtitle,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Per Hour $price ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget buildSrviceCategoryCard(String title, String imagePath,
        Color color) {
      return Container(
        height: 300,
        width: 300,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 60,
            width: 300,
            decoration: BoxDecoration(
              color: color.withOpacity(0.9),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ),
      );
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.green[200],
          backgroundColor: const Color(0xffDCDCDC),
          title: Image.asset(
            'assets/images/Logo_procleaner_v.png',
            fit: BoxFit.contain,
            height: 72,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 350,
                width: double.infinity,
                decoration: const BoxDecoration(
                  // color: Colors.green[200],
                    color: Color(0xffDCDCDC),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Products",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff424242)),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Number of items per row
                          mainAxisSpacing: 10, // Space between rows
                          crossAxisSpacing: 10, // Space between columns
                          childAspectRatio: 1, // Adjust the aspect ratio as needed
                        ),
                        itemCount: 6,
                        // Total number of items
                        itemBuilder: (context, index) {
                          // List of categories and image paths
                          final categories = [
                            {
                              'title': 'Chemical',
                              'imagePath': 'assets/images/CategoryImages/Chemicals.png'
                            },
                            {
                              'title': 'Janitorials',
                              'imagePath': 'assets/images/CategoryImages/cleaing.png'
                            },
                            {
                              'title': 'Machines',
                              'imagePath': 'assets/images/CategoryImages/vaccum.png'
                            },
                            {
                              'title': 'Paper',
                              'imagePath': 'assets/images/CategoryImages/paper.png'
                            },
                            {
                              'title': 'PPE',
                              'imagePath': 'assets/images/CategoryImages/ppe.png'
                            },
                            {
                              'title': 'Amenities',
                              'imagePath': 'assets/images/CategoryImages/hospital.png'
                            },
                          ];

                          return buildCategoryCard(
                            categories[index]['title']!,
                            categories[index]['imagePath']!,
                          );
                        },
                      ),
                    ),


                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Cleaing Company",
                  style: TextStyle(
                      color: Color(0xff424242),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildServiceProduct(
                        "The Cleaner",
                        "we provide top-tier, eco-friendly cleaning services tailored to ensure your space is spotless",
                        'assets/images/CategoryImages/paper.png',
                        40),
                    buildServiceProduct(
                        'ABC',
                        "we provide best cleaning service with latest equipments ",
                        'assets/images/CategoryImages/hospital.png',
                        60),
                    buildServiceProduct(
                      "The Cleaner",
                      "Top-tier, eco-friendly cleaning services tailored for a spotless space",
                      'assets/images/CategoryImages/paper.png',
                      40,
                    ),
                    buildServiceProduct(
                      'ABC Cleaners',
                      "Best cleaning service with latest equipment",
                      'assets/images/CategoryImages/hospital.png',
                      60,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Categories",
                  style: TextStyle(
                      color: Color(0xff424242),
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
              SizedBox(
                  height: 320,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildSrviceCategoryCard(
                            'Cleaning furniture',
                            'assets/images/CategoryImages/furniture.png',
                            Colors.brown),
                        buildSrviceCategoryCard(
                            'Car Wash',
                            'assets/images/CategoryImages/car.png',
                            Colors.blue),
                        buildSrviceCategoryCard(
                            'Pressure Wash',
                            'assets/images/CategoryImages/washingwalls.jpeg',
                            Colors.green),
                      ])),


              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Pest Control",
                  style: TextStyle(
                      color: Color(0xff424242),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: 250, // Adjust height as needed
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildServiceProduct(
                      "The Cleaner",
                      "Top-tier, eco-friendly cleaning services tailored for a spotless space",
                      'assets/images/CategoryImages/paper.png',
                      40,
                    ),
                    buildServiceProduct(
                      'ABC Cleaners',
                      "Best cleaning service with latest equipment",
                      'assets/images/CategoryImages/hospital.png',
                      60,
                    ),
                    buildServiceProduct(
                      "The Cleaner",
                      "Top-tier, eco-friendly cleaning services tailored for a spotless space",
                      'assets/images/CategoryImages/paper.png',
                      40,
                    ),
                    buildServiceProduct(
                      'ABC Cleaners',
                      "Best cleaning service with latest equipment",
                      'assets/images/CategoryImages/hospital.png',
                      60,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Indstrial Cleaning Solutions",
                  style: TextStyle(
                      color: Color(0xff424242),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: 250, // Adjust height as needed
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildServiceProduct(
                      "The Cleaner",
                      "Top-tier, eco-friendly cleaning services tailored for a spotless space",
                      'assets/images/CategoryImages/paper.png',
                      40,
                    ),
                    buildServiceProduct(
                      'ABC Cleaners',
                      "Best cleaning service with latest equipment",
                      'assets/images/CategoryImages/hospital.png',
                      60,
                    ),
                    buildServiceProduct(
                      "The Cleaner",
                      "Top-tier, eco-friendly cleaning services tailored for a spotless space",
                      'assets/images/CategoryImages/paper.png',
                      40,
                    ),
                    buildServiceProduct(
                      'ABC Cleaners',
                      "Best cleaning service with latest equipment",
                      'assets/images/CategoryImages/hospital.png',
                      60,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

}
