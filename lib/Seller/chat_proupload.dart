// // pages/product_upload.dart
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:io';
//
// class ProductUpload extends StatefulWidget {
//   const ProductUpload({super.key});
//
//   @override
//   State<ProductUpload> createState() => _ProductUploadState();
// }
//
// class _ProductUploadState extends State<ProductUpload> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();
//   final TextEditingController _stockController = TextEditingController();
//   final TextEditingController _colorController = TextEditingController();
//   File? _imageFile;
//   final picker = ImagePicker();
//   String? _selectedCategory;
//
//   List<String> categories = ['Chemicals', 'Cleaning Tools', 'Machines', 'Car Wash'];
//
//   Future<void> _pickImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _imageFile = File(pickedFile.path);
//       });
//     }
//   }
//
//   Future<void> _uploadProduct() async {
//     if (_imageFile != null && _titleController.text.isNotEmpty && _selectedCategory != null) {
//       final storageRef = FirebaseStorage.instance
//           .ref()
//           .child('product_images/${DateTime.now().toIso8601String()}');
//       final uploadTask = storageRef.putFile(_imageFile!);
//       final snapshot = await uploadTask.whenComplete(() {});
//       final imageUrl = await snapshot.ref.getDownloadURL();
//
//       await FirebaseFirestore.instance.collection('products').add({
//         'title': _titleController.text,
//         'description': _descriptionController.text,
//         'price': int.parse(_priceController.text),
//         'stock': int.parse(_stockController.text),
//         'color': _colorController.text,
//         'category': _selectedCategory, // <-- Add the selected category
//         'image': imageUrl,
//         'created_at': Timestamp.now(),
//       });
//
//       _titleController.clear();
//       _descriptionController.clear();
//       _priceController.clear();
//       _stockController.clear();
//       _colorController.clear();
//       setState(() {
//         _imageFile = null;
//       });
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Product added successfully!')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Product'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildTextField("Product Name", _titleController),
//             const SizedBox(height: 10),
//             _buildTextField("Product Description", _descriptionController),
//             const SizedBox(height: 10),
//             _buildTextField("Price", _priceController, inputType: TextInputType.number),
//             const SizedBox(height: 10),
//             _buildTextField("Stock", _stockController, inputType: TextInputType.number),
//             const SizedBox(height: 10),
//             _buildTextField("Product Color", _colorController),
//             const SizedBox(height: 20),
//             const Text(
//               "Select Category",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             DropdownButtonFormField<String>(
//               hint: Text('Choose Category'),
//               value: _selectedCategory,
//               items: categories.map((category) {
//                 return DropdownMenuItem<String>(
//                   value: category,
//                   child: Text(category),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   _selectedCategory = value;
//                 });
//               },
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               "Upload Image",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             GestureDetector(
//               onTap: _pickImage,
//               child: Container(
//                 height: 150,
//                 width: double.infinity,
//                 color: Colors.grey[300],
//                 child: _imageFile == null
//                     ? const Icon(Icons.add_a_photo, size: 50)
//                     : Image.file(_imageFile!, fit: BoxFit.cover),
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _uploadProduct,
//               child: Text("Submit"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(String label, TextEditingController controller,
//       {TextInputType inputType = TextInputType.text}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 8),
//         TextFormField(
//           controller: controller,
//           keyboardType: inputType,
//           decoration: InputDecoration(
//             hintText: "Enter $label",
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
