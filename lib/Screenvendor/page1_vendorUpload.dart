import 'dart:io' as io; //for android

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class ProductUpload extends StatefulWidget {
  const ProductUpload({super.key});

  @override
  State<ProductUpload> createState() => _ProductUploadState();
}

class _ProductUploadState extends State<ProductUpload> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  io.File? _imageFile; //for ios
  //for web
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (kIsWeb) { //for websites
        setState(() async {
          // Handle web case if needed
        });
      } else { //for android and ios
        setState(() {
          _imageFile = io.File(pickedFile.path);
        });

        // **Highlight: Log the file path to ensure the image is correctly picked**
        print("Selected image path: ${_imageFile?.path}");
      }
    }
  }

  Future<void> _uploadProduct() async {
    try {
      if (_imageFile != null && _titleController.text.isNotEmpty) {
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('product_images/${DateTime.now().toIso8601String()}');
        final uploadTask = storageRef.putFile(_imageFile!);
        final snapshot = await uploadTask.whenComplete(() {});
        final imageUrl = await snapshot.ref.getDownloadURL();

        await FirebaseFirestore.instance.collection('products').add({
          'title': _titleController.text,
          'price': int.parse(_priceController.text),
          'image': imageUrl,
          'created_at': Timestamp.now(),
        });

        _titleController.clear();
        _priceController.clear();
        setState(() {
          _imageFile = null;
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Product added successfully!"),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Please fill in all fields and select an image."),
        ));
      }
    } catch (e, stackTrace) {
      // **Highlight: Improved error handling with full stack trace for better debugging**
      print("Error: $e");
      print("Stack trace: $stackTrace");

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error uploading product: $e"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        actions: [
          Text("data"),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField("Product name", _titleController),
                _buildTextField("Price", _priceController),

                const SizedBox(height: 20),
                const Text(
                  "Upload Image",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: _imageFile == null
                        ? const Icon(Icons.add_a_photo, size: 50)
                        : Image.file(_imageFile!, fit: BoxFit.cover),
                  ),
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _uploadProduct,
                  child: Text("Submit"),
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {TextInputType inputType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          decoration: InputDecoration(
            hintText: "Enter $label",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
