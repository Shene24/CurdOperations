import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class operations extends StatelessWidget {
   operations({Key? key}) : super(key: key);
  final FirebaseFirestore _firebaseFirestore =    FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("1"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text("hello"),
              ElevatedButton(onPressed: (){
                addName();
              }, child: Text("ADD DATA"))
            ],
          ),
          
          ),
      ),
    );
  }
  addName(){
    _firebaseFirestore.collection("secondCollection").add({"first_name": "shene"
    });

  }
}