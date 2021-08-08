import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:padvisor/Services/auth_student.dart';
import 'package:padvisor/screen/notice.dart';
import 'package:padvisor/screen/write_message.dart';

class HODMessage extends StatelessWidget {
  String id = FirebaseAuth.instance.currentUser.uid;
  final AuthStudentService _auth = AuthStudentService();

  Stream<QuerySnapshot> get listOfInboxMessages {
    final CollectionReference noticeListCollection = FirebaseFirestore.instance
        .collection('hodData')
        .doc(id)
        .collection('Inbox Message');
    return noticeListCollection.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: listOfInboxMessages,
        initialData: null,
        builder: (context, snapshot) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.red,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => writeMessage()));
              },
            ),
            body: messageBody(context, snapshot),
          );
        });
  }
}

Widget messageBody(BuildContext context, AsyncSnapshot<QuerySnapshot> as) {
  return Column(
    children: [
      Container(
          padding: EdgeInsets.only(top: 12, bottom: 12),
          alignment: Alignment.center,
          child: Text(
            'Message',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          )),
      SizedBox(
        height: 25,
      ),
      messageInfo(context, as),
    ],
  );
}

Widget messageInfo(BuildContext context, AsyncSnapshot<QuerySnapshot> as) {
  final messageData = as.data;
  final messageDataList = messageData.docs.toList();

  return SizedBox(
    height: 520,
    child: ListView.builder(
        itemCount: messageDataList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('hai'),
                ListTile(
                  // leading: Image.asset('assets/defaultprofile.png'),
                  title: Text(messageDataList[index]['senderEmail'],
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text(messageDataList[index]['message'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          );
        }),
  );
}
