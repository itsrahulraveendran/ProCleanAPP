import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductUpload extends StatefulWidget {
  const ProductUpload({super.key});

  @override
  State<ProductUpload> createState() => _ProductUploadState();
}

class _ProductUploadState extends State<ProductUpload> {
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
            Text(
              "Product Information",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Prodct Name",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter product name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Prodct Name",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField(
              hint: Text('Select category'),
                items: <String>['a', 'b', 'c', 'd'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),

                  );
                }).toList(),
                onChanged: (_) {}),
SizedBox(height: 50,),
            const Text(
              "Upload Images",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Container(height: 100,width: double.infinity,color: Colors.grey,),
            const Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Product Description",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              showCursor: true,
              decoration: InputDecoration(

                  hintText: "Enter product name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),),
            const Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Enter product name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),),
            const Text(
              "Product Stock",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
        TextFormField(
          decoration: InputDecoration(
              hintText: "Stock",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),),
            const Text(
              "product color",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Color",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),),
SizedBox(height: 50,),

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [ElevatedButton(onPressed: (){}, child: Text("Draft")),
    SizedBox(width: 20,),
    ElevatedButton(
        onPressed: (){}, child: Text("Submit")),
  ],
)


          ],
        ),
      )),
    );
  }
}
