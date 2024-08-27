import 'package:flutter/material.dart';

class Service extends StatefulWidget {
  const Service({super.key});

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Our Services'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ServiceItem(
            icon: Icons.cleaning_services,
            title: 'Cleaning',
            description: 'Professional cleaning services for homes and offices.',
          ),
          ServiceItem(
            icon: Icons.plumbing,
            title: 'Plumbing',
            description: 'Expert plumbing services for all your needs.',
          ),
          ServiceItem(
            icon: Icons.electrical_services,
            title: 'Electrical',
            description: 'Safe and reliable electrical services for your home.',
          ),
          ServiceItem(
            icon: Icons.construction,
            title: 'Construction',
            description: 'High-quality construction and renovation services.',
          ),
          ServiceItem(
            icon: Icons.landscape,
            title: 'Landscaping',
            description: 'Beautiful landscaping services to enhance your outdoor space.',
          ),
        ],
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  ServiceItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.blue),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        onTap: () {
          // Handle tap event
        },
      ),
    );
  }
}
