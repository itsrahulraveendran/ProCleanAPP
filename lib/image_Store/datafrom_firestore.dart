import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//step1 import cloud_fire: 'package:cloud_firestore/cloud_firestore.dart'
import 'package:cloud_firestore/cloud_firestore.dart';

class dataFromFireStore extends StatefulWidget {
  const dataFromFireStore({super.key});

  @override
  State<dataFromFireStore> createState() => _dataFromFireStoreState();
}

class _dataFromFireStoreState extends State<dataFromFireStore> {
//step2 call instance from firebase and add to a name
  CollectionReference _referenceCar_booking =
      FirebaseFirestore.instance.collection('car_booking');
//step3.1 better to call stream builder here otherwise each time build run it will execute so its not good
  late Stream<QuerySnapshot>
      _streambookingCarItems; //step 3.2 ctrl+click on snapshot and take type
  // late //we can use this for intialise soon
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streambookingCarItems = _referenceCar_booking
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
        stream: _streambookingCarItems,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          //get the data
          if (snapshot.connectionState == ConnectionState.active) {
            QuerySnapshot _quarySnaphort = snapshot.data;
            List<QueryDocumentSnapshot> documents = _quarySnaphort.docs;

            //Convert the documents to Maps
            List<Map> items = documents.map((e)=>
            {
              'id':e.id,
          '_name':e['carName'],
          '_color':e['color'],
              '_price':e['price'],
            }).toList();

            //display the list
            return ListView.builder(itemCount: items.length,
            itemBuilder:(BuildContext context,int index){
              //get the item at the index
              Map thisItem=items[index];
              //return the widget for the list items
              return ListTile(
                title: Text('car:${thisItem['_name']}'),
                subtitle: Text('color available: ${thisItem['_color']}'),
                trailing: Text('price: \$${thisItem['_price']}'),
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
