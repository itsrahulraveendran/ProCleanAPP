import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerQuantity = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();

  CollectionReference _reference =
  FirebaseFirestore.instance.collection('shopping_list');

  String _imageURL = '';

  // // Initialize FirebaseAuth instance
  // FirebaseAuth auth = FirebaseAuth.instance;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   // Sign in anonymously when the app starts
  //   signInAnonymously();
  // }
  //
  // // Function to sign in anonymously
  // void signInAnonymously() async {
  //   try {
  //     UserCredential userCredential = await auth.signInAnonymously();
  //     print('Signed in anonymously as: ${userCredential.user!.uid}');
  //   } catch (e) {
  //     print('Error during anonymous sign-in: $e');
  //   }
  // }


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
                  // var user = FirebaseAuth.instance.currentUser;
                  // if (user == null) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //       SnackBar(content: Text('Please sign in before uploading an image')));
                  //   return;
                  // }

                  User? user = FirebaseAuth.instance.currentUser;

                  // Check if user is not null (i.e., user is signed in)
                  if (user == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please sign in before uploading an image')));
                    return;
                  }

                  ImagePicker _imagePicker = ImagePicker();

                  // Properly await the image picker operation
                  XFile? _file = await _imagePicker.pickImage(source: ImageSource.gallery);

                  // Check if the image was picked
                  if (_file == null) return;

                  // Create a unique name for the file
                  String _uniqueFileName =
                  DateTime.now().millisecondsSinceEpoch.toString();

                  // Get a reference to Firebase Storage
                  Reference _referenceRoot = FirebaseStorage.instance.ref();
                  Reference _referenceDirImages =
                  _referenceRoot.child('images/${user.uid}');
                  log('image saved');

                  // Reference for uploading the image
                  Reference _referenceImageUpload =
                  _referenceDirImages.child(_uniqueFileName);

                  try {
                    // Upload the file
                    await _referenceImageUpload.putFile(File(_file.path));
                    // Get the download URL
                    _imageURL = await _referenceImageUpload.getDownloadURL();
                  } catch (error) {
                    print('Error uploading image: $error');
                  }
                },
                icon: Icon(Icons.camera_alt_outlined),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_imageURL.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please upload an image')));
                    return;
                  }

                  if (key.currentState!.validate()) {
                    String itemName = _controllerName.text;
                    String itemQuantity = _controllerQuantity.text;

                    // Create a Map of data to send
                    Map<String, String> dataToSend = {
                      'name': itemName,
                      'quantity': itemQuantity,
                      'image': _imageURL,
                    };

                    // Add the new item
                    _reference.add(dataToSend);
                  }
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
