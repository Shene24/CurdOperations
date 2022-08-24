import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class operations extends StatelessWidget {
   operations({Key? key}) : super(key: key);
  final FirebaseFirestore _firebaseFirestore =    FirebaseFirestore.instance;
  final TextEditingController _namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("1"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              //Text("hello"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _namecontroller,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              Divider(
               height: 25,
              ), //used for space 
              ElevatedButton(onPressed: (){
                addName(name: _namecontroller.text);
              }, child: Text("ADD DATA"))
            ],
          ),
          
          ),
      ),
    );
  }
  //make is a name paramiter by putting inside a {} and adding ? after the string we made it nullable
  addName({String? name }){
    _firebaseFirestore.collection("secondCollection").add({
      "first_name": "$name",
      // "position": "studnet",
      // "age": 24,
      // "fav songs": ["song1", "song2"]
    });

  }
}