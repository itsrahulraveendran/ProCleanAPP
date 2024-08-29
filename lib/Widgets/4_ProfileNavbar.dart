import 'package:flutter/material.dart';

import '../Screens/Page14_ProdctOpenPage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Dashboard'),
        automaticallyImplyLeading: false,//to remove backbutton
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/CategoryImages/officeCleaning.png'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Olivia Smith',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text('Welcome back!'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Quick Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildQuickAction(Icons.add, 'Book a Service'),
                _buildQuickAction(Icons.history, 'View Past Services'),
                _buildQuickAction(Icons.star, 'Rate a Cleaner'),
              ],
            ),
            const SizedBox(height: 20),


            Row(
              children: [
                _buildSpecialOfferCard('Discount 20%', 'Get 20% off on your next service',
                    'assets/images/CategoryImages/cawash.png'),
                const SizedBox(width: 10),
                _buildSpecialOfferCard('Holiday Pack', 'Special holiday cleaning package',
                    'assets/images/CategoryImages/ecocarwash.png'),
              ],
            ),
            const SizedBox(height: 20),

            // Our Services
            const Text(
              'Our Services',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 165,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [

                  _buildServiceCard('Home Cleaning', 'Regular home cleaning services', 'assets/images/CategoryImages/officeCleaning.png', context, ProductOrder()),
                  _buildServiceCard('Office Cleaning',
                      'Professional office cleaning', 'assets/images/CategoryImages/officeCleaning.png', context, ProductOrder()),
                  _buildServiceCard('Deep Cleaning', 'Thorough deep cleaning',
                      'assets/images/CategoryImages/officeCleaning.png', context, ProductOrder()),
                  _buildServiceCard("ABC", "subtitle", 'assets/images/CategoryImages/officeCleaning.png', context, ProductOrder())

                ],
              ),
            ),
            const SizedBox(height: 20),

            // Customer Reviews
            const Text(
              'Customer Reviews',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildReviewCard(
                'Emily Johnson',
                'Great service! The cleaner was punctual and did a fantastic job.',
                '2023-09-15',
                10,
                0),
            _buildReviewCard(
                'Michael Brown',
                'Very satisfied with the office cleaning service. Highly recommend!',
                '2023-09-20',
                8,
                1),
            _buildReviewCard(
                'Sophia Williams',
                'The deep cleaning service was thorough and exceeded my expectations.',
                '2023-09-25',
                12,
                0),

            const SizedBox(height: 20),

            // Recent Activity
            const Text(
              'Recent Activity',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'You booked a home cleaning service on Oct 10. '
                  'You rated a cleaner on Sep 20. '
                  'You canceled a booking on Sep 25. '
                  'You made a payment on Sep 30.',
            ),
          ],
        ),
      ),

    );
  }

  // Helper method to build quick action cards
  Widget _buildQuickAction(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: Icon(icon, size: 30),
        ),
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }

  // Helper method to build booking cards
  Widget _buildBookingCard(String title, String subtitle, String imagePath) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Image.asset(imagePath, width: 60, height: 60, fit: BoxFit.cover),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }

  // Helper method to build special offer cards
  Widget _buildSpecialOfferCard(String title, String subtitle, String imagePath) {
    return Expanded(
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(subtitle),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build service cards
  Widget _buildServiceCard(String title, String subtitle, String imagePath,BuildContext context,Widget pageNavigation) {
    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>pageNavigation));},
      child: SizedBox(
        width: 160,
        child: Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imagePath, width: 160, height: 80, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(subtitle),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build review cards
  Widget _buildReviewCard(
      String name, String review, String date, int upvotes, int downvotes) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/userprofile.png'),
        ),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(review),
            const SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.thumb_up, size: 16, color: Colors.grey),
                const SizedBox(width: 5),
                Text('$upvotes'),
                const SizedBox(width: 20),
                Icon(Icons.thumb_down, size: 16, color: Colors.grey),
                const SizedBox(width: 5),
                Text('$downvotes'),
                const SizedBox(width: 20),
                Text(date, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
