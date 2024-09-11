import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proclean_app/Screens/NavBAR.dart';
import 'package:proclean_app/model/user_model.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

final formKey = GlobalKey<FormState>();
TextEditingController nameController = TextEditingController();
TextEditingController eMailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Row(children: [Image.asset('assets/images/logo_bg.png',fit: BoxFit.contain,height: 72,width: 50,),],),),
      appBar: AppBar(
        title: Image.asset(
          'assets/images/Logo_procleaner_v.png',
          fit: BoxFit.contain,
          height: 72,
        ),
        // toolbarHeight: 88,
        // actions: [
        //   IconButton(onPressed: () => {}, icon: Icon(Icons.search)),
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lets Register Account",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 80,
                  width: 200,
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Hello user , you have a greatful journey",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                TextFormField(
                  controller: nameController,
                  validator: (nameValue) {
                    if (nameValue == null || nameValue.isEmpty) {
                      return "Enter the name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 5,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: eMailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 5,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 5,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                TextFormField(
                  validator: (value) {
                    if (value != passwordController.text) {
                      return "password not match";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Confirm password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 5,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          fixedSize: Size(350, 40),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            UserModel user = UserModel(
                                ZZfullName: nameController.text,
                                eMail: eMailController.text,
                                password: passwordController.text);
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: eMailController.text,
                                    password: passwordController.text)
                                .then((value) {
                              String id = value.user!.uid;
                              FirebaseFirestore.instance
                                  .collection("User")
                                  .doc(id)
                                  .set(user.toMap())
                                  .then((value) => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              landingPage())));
                            }).catchError((error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Signup filed:$error")),
                              );
                            });
                          }
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account"),
                    TextButton(onPressed: () {}, child: Text("LogIn"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
