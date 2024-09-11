import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//step1 import cloud_fire: 'package:cloud_firestore/cloud_firestore.dart'
import 'package:cloud_firestore/cloud_firestore.dart';

class dataFromSHOPPINGFIREBASE extends StatefulWidget {
  const dataFromSHOPPINGFIREBASE({super.key});

  @override
  State<dataFromSHOPPINGFIREBASE> createState() => _dataFromSHOPPINGFIREBASEState();
}

class _dataFromSHOPPINGFIREBASEState extends State<dataFromSHOPPINGFIREBASE> {
//step2 call instance from firebase and add to a name
  CollectionReference _collectionReferenceShoppingList =
  FirebaseFirestore.instance.collection('shopping_list');
//step3.1 better to call stream builder here otherwise each time build run it will execute so its not good
  late Stream<QuerySnapshot>
  _streamShoppingListItesms; //step 3.2 ctrl+click on snapshot and take type
  // late //we can use this for intialise soon
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamShoppingListItesms = _collectionReferenceShoppingList
        .snapshots(); //same to name and we have to define its type in up
  }

  @override
  Widget build(BuildContext context) {
//Step3 its afuture its collection list of firebase
//     _referenceCar_booking.get();//if use this its call the collection list but not future or realtime
//     _referenceCar_booking.snapshots();//its will immediatly get update realtime stream

    return Scaffold(
      appBar: AppBar(
        title: Text("Data from firebase"),
      ),
      //step 4 if conditions

      body: StreamBuilder<QuerySnapshot>(
        stream: _streamShoppingListItesms,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          //get the data
          if (snapshot.connectionState == ConnectionState.active) {
            QuerySnapshot _querySNAPshot = snapshot.data;
            List<QueryDocumentSnapshot> documents = _querySNAPshot.docs;

            //Convert the documents to Maps
            List<Map> items = documents.map((doc)=>
            {
              'id':doc.id,
              'name':doc['name'],
              'quantity':doc['quantity'],
              'image':doc['image'],
            }).toList();

            Text("this is for shopping list view");

            //display the list
            return ListView.builder(itemCount: items.length,
                itemBuilder:(BuildContext context,int index){
                  //get the item at the index
                  Map thisItem=items[index];
                  //return the widget for the list items
                  return ListTile(
                    leading: thisItem['image'] != ''
                        ? Image.network(
                      thisItem['image'],
                      width: 50,  // Adjust image size as needed
                      height: 50,
                      fit: BoxFit.cover,
                    )
                        : Icon(Icons.directions_car),
                    title: Text('${thisItem['name']??'name is not availabe'}'),
                    subtitle: Text('${thisItem['quantity']??'name is not availabe'}'),

                  );
                }
            );
          }


          //if none of the above true use Cirularprograssive indicator for next step
          return Center(child: CircularProgressIndicator());
        },
      ), //step 4<QuerySnapshot> this from ctrl+click snapshot AsyncSnapshot it will give instance of quary data
    );
  }
}
