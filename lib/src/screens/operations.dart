import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class operations extends StatelessWidget {
   operations({Key? key}) : super(key: key);
  final FirebaseFirestore _firebaseFirestore =    FirebaseFirestore.instance;
  final TextEditingController _namecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
              //get data using future builder
              //getDataUsingFutureBuilder(),
              Container(
                height: 350,
                padding: EdgeInsets.all(10),
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: _firebaseFirestore.collection("secondCollection").snapshots(),
                  builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return CircularProgressIndicator();
                    }else if(snapshot.hasError){
                      return Text("err ${snapshot.error}");
                    }else if (snapshot.data ==null){
                      return Text("no data");
                    }
                    snapshot.data!.docs.first;

                    return ListView.separated(
                      itemCount: snapshot.data!.docs.length, 
                      separatorBuilder:(BuildContext context, int index){
                        return Divider();
                      },
                      itemBuilder: (BuildContext context, int index) { 
                        return Text(
                          snapshot.data!.docs[index].data()["first_name"].toString());
                      },
                      );
                      
                      
                      //   return Text(snapshot.data!.docs.first.data()["first_name"].toString());
                        
                       }),

              
              ),
              //readOneDoc(),
            
             
              Padding(
                padding: const EdgeInsets.all(20),
                // child: TextField(
                //   controller: _namecontroller,
                //   decoration: InputDecoration(border: OutlineInputBorder()),
                // ),
                child: Form(
                key: _formKey, //connected with the globalkey
                  child:Column(
                    children: [
                      TextFormField(
                        validator: (value){
                          if (value ==null|| value.isEmpty){
                            return "Please enter some data";
                          }
                          return null;
                        }, 
                        controller: _namecontroller,
                        decoration: InputDecoration(border: OutlineInputBorder()),
                        
                      ),
                    ],
                  ),
                 ),
              ),
              // Divider(
              //  height: 15,
              // ), //used for space 
              ElevatedButton(
                onPressed: ()async{
                  if(_formKey.currentState!.validate()==true){
                    debugPrint("form validated");
                    addName(name: _namecontroller.text).then((value) => print(value.path));//showing the path of the doc
              } else{
                debugPrint("form is not validated");
              }
              },
              child: Text("ADD DATA"))
            ],
          ),
          
          ),
      ),
    );
  }
  //make is a name paramiter by putting inside a {} and adding ? after the string we made it nullable
    //how to make the name required to not send null data to the DB?
    // By removing the ? and write required before the string
  Future <DocumentReference> addName({required String name })async{
    DocumentReference _doc = await
    _firebaseFirestore.collection("secondCollection").add({
      "first_name": "$name",
    
      // "position": "studnet",
      // "age": 24,
      // "fav songs": ["song1", "song2"]
    });
    return _doc;
  //aysnc needs time we should add waiting
  }
  Future <DocumentSnapshot> readDoc()async{
    DocumentSnapshot _doc =
    await  _firebaseFirestore.doc("secondCollection/DvvrSW7YXMkzCx7eq1Ue").get();
    print(_doc.data());
    return _doc;

    //reading single doc

  }
 Future<QuerySnapshot<Map<String, dynamic>>> getDataOnce()async{
  return await _firebaseFirestore.collection("secondCollection").get();

 }
 Widget getDataUsingFutureBuilder(){
  return   Column(
                children: [
                  Text("read the entire collection docs once"),
                  Container(
                    height: 250,
                     
                    child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      future: getDataOnce(), 
                      builder: (context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                          
                        }else if (snapshot.hasError){
                          return Text(snapshot.error.toString());
                        }else if (snapshot.data ==null){
                          return Text("no data");
                        }

                       return  ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return Text(
                              snapshot.data!.docs[index].data()["first_name"].toString());
                            
                            
                          });
                           
                      }),
                  ),
                ],
              );
 }
 Widget readOneDoc(){
  return  Column(
                children: [
                 // Text("read one specific doc"),
                  Container(
                    child: FutureBuilder<DocumentSnapshot>(
                      future: readDoc(),
                      builder:(context, snapshot) {
                        if(snapshot.connectionState ==ConnectionState.waiting){
                          return CircularProgressIndicator();
                        }else if (snapshot.data==null|| !snapshot.hasData){
                          return Text("empty");
                        } else if (snapshot.hasError){
                          return Text(snapshot.error.toString());
                        }
                        return Text(snapshot.data!.data().toString());
                      }),
                       
                  ),
                ],
              );
 }
}
/*summary: we added firebase core to connenct it with the firebase, and the databse that we use in firebsae is cloud firestore
then u have to add could firestore package 
how we did it?
we get an instance of FirebaseFirestore.instance 
we wrote a method fer getting the data, and inside the method we created a collection and give it 
a value a string that we called a name by using add after collection it will add data to the collection
then we created a textfield which has a controller that give us a data from the textfield we also 
created TextEditController for that 
*/
