import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Image_upload extends StatefulWidget {
  const Image_upload({super.key});

  @override
  State<Image_upload> createState() => _Image_uploadState();
}

class _Image_uploadState extends State<Image_upload> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerQuantity = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();

  CollectionReference _reference =
  FirebaseFirestore.instance.collection('shopping_list');

  String _imageURL = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADD AN ITEM'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Form(
          key: key,
          child: Column(
            children: [
              TextFormField(
                controller: _controllerName,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter item name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter the item',
                ),
              ),
              SizedBox(height: 15),
              Text("image"),
              TextFormField(
                controller: _controllerQuantity,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter quantity';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Number',
                ),
              ),
              SizedBox(height: 15),
              IconButton(
                onPressed: () async {
                  User? user = FirebaseAuth.instance.currentUser;

                  if (user == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Please sign in before uploading an image')));
                    return;
                  }

                  ImagePicker _imagePicker = ImagePicker();
                  XFile? file =
                  await _imagePicker.pickImage(source: ImageSource.gallery);

                  if (file == null) return;

                  String _uniqueFileName =
                  DateTime.now().millisecondsSinceEpoch.toString();

                  try {
                    Reference _referenceDirImages =
                    FirebaseStorage.instance.ref().child('images/${user.uid}');
                    Reference _referenceImageUpload =
                    _referenceDirImages.child('$_uniqueFileName.jpg');

                    // Upload file
                    await _referenceImageUpload.putFile(File(file.path));

                    // Get download URL
                    _imageURL = await _referenceImageUpload.getDownloadURL();
                    log("Image uploaded: $_imageURL");
                  } catch (error) {
                    log('Error uploading image: $error');
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error uploading image')));
                  }
                },
                icon: Icon(Icons.camera_alt_outlined),
              ),
              ElevatedButton(
                onPressed: () async {
                  // if (_imageURL.isEmpty) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //       SnackBar(content: Text('Please upload an image')));
                  //   return;
                  // }

                  if (key.currentState!.validate()) {
                    String itemName = _controllerName.text;
                    String itemQuantity = _controllerQuantity.text;

                    Map<String, String> dataToSend = {
                      'name': itemName,
                      'quantity': itemQuantity,
                      'image': _imageURL,
                    };

                    try {
                      await _reference.add(dataToSend);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Product added successfully!")));

                      _controllerName.clear();
                      _controllerQuantity.clear();
                      _imageURL = '';
                    } catch (e) {
                      log("Error adding item: $e");
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Error adding item")));
                    }
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
