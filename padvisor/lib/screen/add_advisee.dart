import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:padvisor/Services/database.dart';
import 'package:provider/provider.dart';

class addAdvisee extends StatelessWidget {
  String matric;

  final CollectionReference studentCollection =
      FirebaseFirestore.instance.collection('StudentData');

  final CollectionReference adviseeCollection =
      FirebaseFirestore.instance.collection('AdvisorAdvisee');

  final _controllerMatric = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseServices().studentData,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text('PAdvisor'),
          backgroundColor: Colors.grey,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 100),
                alignment: Alignment.center,
                child: Text(
                  'Add Advisee',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 25, top: 50),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pick Advisee: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 15),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: _controllerMatric,
                  decoration: InputDecoration(
                    hintText: 'Enter Matric no. ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              SizedBox(
                height: 90,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    minimumSize: Size(150, 32),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18))),
                child: Text('Confirm'),
                onPressed: () async {
                  matric = _controllerMatric.text;

                  QuerySnapshot matricStream = await studentCollection
                      .where('MatricNo', isEqualTo: matric)
                      .get();

                  if (matricStream != null) {
                    List<QueryDocumentSnapshot> matricStreamList =
                        matricStream.docs;
                    String realMatric = matricStreamList.first.get('MatricNo');
                    String realName = matricStreamList.first.get('name');
                    String realCohort = matricStreamList.first.get('Cohort');

                    String uid = FirebaseAuth.instance.currentUser.uid;
                    DatabaseServices(uid: uid)
                        .registerAdvisee(realMatric, realName, realCohort);

                    print(realMatric + ' Name: ' + realName);
                    print('UID = ' + FirebaseAuth.instance.currentUser.uid);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid Matric no.')));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

//final databaseReference = Firestore.instance;
//databaseReference.collection('main collection name').document( unique id).collection('string name').document().setData(); 
//// your answer missing **.document()**  before setData