import 'package:flutter/material.dart';

class ServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CleanShop'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(child: Column(children: [Text("data"),Text("product1")],),

        // Add drawer content here
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for cleaning products',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 20),

              // Category Tabs
              DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      tabs: [
                        Tab(text: 'Chemicals'),
                        Tab(text: 'Janitorials'),
                        Tab(text: 'PPE'),
                      ],
                      indicatorColor: Colors.blue,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                    ),
                    SizedBox(
                      height: 200, // Adjust height as needed
                      child: TabBarView(
                        children: [
                          _buildProductGrid('assets/images/CategoryImages/paper.png'),
                          _buildProductGrid('assets/images/CategoryImages/Chemicals.png'),
                          _buildProductGrid('assets/images/CategoryImages/ppe.png'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Filter & Sort
              const Text(
                'Filter & Sort',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  FilterChip(
                    label: const Text('Price'),
                    onSelected: (bool selected) {},
                  ),
                  const SizedBox(width: 10),
                  FilterChip(
                    label: const Text('Popularity'),
                    onSelected: (bool selected) {},
                  ),
                  const SizedBox(width: 10),
                  FilterChip(
                    label: const Text('Ratings'),
                    onSelected: (bool selected) {},
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Featured Products
              const Text(
                'Featured Products',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildProductCard('assets/images/CategoryImages/paper.png'),
                    _buildProductCard('assets/images/CategoryImages/Chemicals.png'),
                    _buildProductCard('assets/images/CategoryImages/hospital.png'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Product Details
              const Text(
                'Product Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Lysol Disinfectant Spray is a powerful cleaner that kills 99.9% of viruses and bacteria. It is ideal for use on hard, non-porous surfaces in your home, including countertops, sinks, and door handles...',
              ),
              const SizedBox(height: 20),

              // Related Products
              const Text(
                'Related Products',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildProductCard('assets/images/CategoryImages/Chemicals.png'),
                  _buildProductCard('assets/images/CategoryImages/ppe.png'),
          _buildProductCard('assets/images/CategoryImages/vaccum.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  // Helper method to build product grid
  Widget _buildProductGrid(String productImage) {
    return GridView.builder(
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 4,
      ),
      itemBuilder: (context, index) {
        return _buildProductCard(productImage);
      },
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }

  // Helper method to build product card
  Widget _buildProductCard(String image) {

    return Card(

      elevation: 4,
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(

            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Product Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '\$9.99',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
