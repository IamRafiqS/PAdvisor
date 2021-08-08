import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DeleteAdvisee extends StatelessWidget {
  //
  // initialize controller
  final _matricController = TextEditingController();

  // Collection Reference
  final CollectionReference adviseeCollection =
      FirebaseFirestore.instance.collection('AdvisorAdvisee');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'Remove Student ',
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
                controller: _matricController,
                decoration: InputDecoration(
                  hintText: 'Enter Matric no... ',
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
                String matric = _matricController.text;
                //
                // this line is for spacing
                // this line is used to get the user uid
                String uid = FirebaseAuth.instance.currentUser.uid;

                //
                // QuerySnapshot matricStream = await adviseeCollection
                //     .doc(uid)
                //     .collection('student')
                //     .where('matricNo', isEqualTo: matric)
                //     .get();

                FirebaseFirestore.instance
                    .collection('AdvisorAdvisee')
                    .doc(uid)
                    .collection('student')
                    .doc(matric)
                    .delete()
                    .then((value) => print('Deleted'));

                //
                // this line is for spacing

                // List<QueryDocumentSnapshot> matricStreamList =
                //     matricStream.docs;
                // String realMatric = matricStreamList.first.get('MatricNo');
                // String realName = matricStreamList.first.get('name');

                // print('Name: ' + realName + ' MAtric: ' + realMatric);

                // FirebaseFirestore.instance
                //     .collection('AdvisorAdvisee')
                //     .doc(uid)
                //     .collection('student')
                //     .doc(realMatric)
                //     .delete();
              },
            )
          ],
        ),
      ),
    );
  }
}
