import 'package:flutter/material.dart';

class Chemicals extends StatelessWidget {
  Chemicals({super.key});

  // Example data for the grid items
  final List<Map<String, dynamic>> products = [
    {
      "image": 'assets/images/CategoryImages/Chemicals.png',
      "title": "Advance RANGER Heavy \nOven, Grill Cleaner",
      "price": 38,
    },
    {
      "image": 'assets/images/CategoryImages/Chemicals.png',
      "title": "Ultra Power Cleaner\nfor Ovens and Grills",
      "price": 40,
    },
    {
      "image": 'assets/images/CategoryImages/Chemicals.png',
      "title": "MaxSafe Heavy Duty\nRange Cleaner",
      "price": 42,
    },
    {
      "image": 'assets/images/CategoryImages/Chemicals.png',
      "title": "ProClean Oven & Grill\nCleaner",
      "price": 35,
    },
    {
      "image": 'assets/images/CategoryImages/Chemicals.png',
      "title": "Super Strength Range\nCleaner",
      "price": 39,
    },
    {
      "image": 'assets/images/CategoryImages/Chemicals.png',
      "title": "High Performance\nGrill Cleaner",
      "price": 37,
    },
    {
      "image": 'assets/images/CategoryImages/Chemicals.png',
      "title": "OvenMax Industrial\nCleaner",
      "price": 45,
    },
    {
      "image": 'assets/images/CategoryImages/Chemicals.png',
      "title": "GrillMaster Professional\nRange Cleaner",
      "price": 44,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chemical Products"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Chemical Products",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                crossAxisSpacing: 8.0, // Spacing between columns
                mainAxisSpacing: 8.0,  // Spacing between rows
                childAspectRatio: 0.7,  // Aspect ratio for the cards
              ),
              itemCount: products.length, // Number of items in the grid
              itemBuilder: (context, index) {
                final product = products[index];
                return _chemicalProductBuilder(product["image"], product["title"], product['price']);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _chemicalProductBuilder(String image, String title, int price) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 4,
        color: Colors.grey[200], // Adjust background color as needed
        child: Column(
          children: [
            // Product Image
            Image.asset(
              image,
              height: 120,
              width: 200,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 8),
            // Product Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 4),
            // Volume
            Text(
              'Volume: 5L',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 8),
            // Price
            TextButton(
              onPressed: () {},
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '\$$price',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                    TextSpan(
                      text: ' excl GST',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

