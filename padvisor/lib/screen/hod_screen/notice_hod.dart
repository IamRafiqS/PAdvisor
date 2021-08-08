import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; //new!
import 'package:padvisor/screen/hod_screen/add_notice.dart';

class NoticeHOD extends StatefulWidget {
  @override
  _NoticeHODState createState() => _NoticeHODState();
}

class _NoticeHODState extends State<NoticeHOD> {
  Stream<QuerySnapshot> get listOfNotices {
    final CollectionReference noticeListCollection = FirebaseFirestore.instance
        .collection('Notice')
        .doc('Announcement')
        .collection('Notice Lists');
    return noticeListCollection.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: listOfNotices,
        initialData: null,
        builder: (context, snapshot) {
          return Scaffold(
            body: noticeBody(context, snapshot),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddNotice()),
                );
              },
              child: Icon(Icons.add),
            ),
          );
        });
  }

  void getNotice() {
    FirebaseFirestore.instance
        .collection("Notice")
        .doc("Announcement")
        .collection("Notice Lists")
        .orderBy("index", descending: true)
        .get()
        .then((querysnapshot) {
      querysnapshot.docs.forEach((value) {
        noticeInfo(value["title"], value["content"]);
      });
    });
  }
}

Widget noticeBody(BuildContext context, AsyncSnapshot<QuerySnapshot> as) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            alignment: Alignment.center,
            child: Text(
              'Notice',
              style: GoogleFonts.robotoSlab(
                textStyle: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ), //new!
            ),
          ),
          Container(height: 500, child: noticeInfo(context, as)),
        ],
      ),
    ),
  );
}

Widget noticeInfo(BuildContext context, AsyncSnapshot<QuerySnapshot> as) {
  final noticeData = as.data;
  final noticeDataList = noticeData.docs.toList();
  return ListView.builder(
      itemCount: noticeDataList.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              noticeDataList[index]['title'],
              style: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              noticeDataList[index]['content'],
              // details,
              style: TextStyle(color: Colors.grey[600]),
            ),
            Divider(
              height: 10,
              thickness: 2,
              //color: Colors.amberAccent,
            )
          ],
        );
      });
}

Widget textColor(String text, double size) {
  return Text(
    text,
    style: TextStyle(
        color: Colors.red, fontSize: size, fontWeight: FontWeight.bold),
  );
}

void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      print('Clicked Archived');
      break;
    case 1:
      print('Clicked Settings');
      break;
    case 2:
      print('Clicked Sign Out');
      break;
  }
}
