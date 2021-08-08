import 'package:flutter/material.dart';
import 'package:padvisor/screen/hod_screen/homepage_hod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../login_hod.dart';
import 'settings_hod.dart';

class AddNotice extends StatefulWidget {
  @override
  _AddNoticeState createState() => _AddNoticeState();
}

class _AddNoticeState extends State<AddNotice> {
  final CollectionReference noticeCollection =
      FirebaseFirestore.instance.collection('Notice');
  final CollectionReference noticeListCollection = FirebaseFirestore.instance
      .collection('Notice')
      .doc('Announcement')
      .collection('Notice Lists');

  String noticeTitle,
      noticeContent,
      noticeTo,
      holder = '',
      dropdownValue = 'All';
  List<String> noticeToList = ['All', 'Lecturers Only', 'Students Only'];

  final _controllerNoticeTitle = TextEditingController();
  final _controllerNoticeContent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAdvisor'),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 16.0),
            Text(
              "New Notice",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 32.0),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          'To:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            onChanged: (String data) {
                              setState(() {
                                dropdownValue = data;
                              });
                            },
                            items: noticeToList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Notice Title",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    controller: _controllerNoticeTitle,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Write notice title",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.0),
                  Text(
                    "Notice Post",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    maxLines: 12,
                    controller: _controllerNoticeContent,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Write notice post",
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.redAccent, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    height: 40,
                    width: 200,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      onPressed: () {
                        getDropDownItem();
                        noticeTo = holder;
                        noticeTitle = _controllerNoticeTitle.text;
                        noticeContent = _controllerNoticeContent.text;

                        int index;
                        final docRef = noticeCollection.doc('Current Index');
                        docRef.get().then((value) {
                          index = value.get('index') + 1;
                        });

                        noticeCollection.get().then((querysnapshot) {
                          if (querysnapshot.docs.isEmpty) {
                            addCurrentIndex(1);
                            addNotice(noticeTo, noticeTitle, noticeContent, 1);
                          } else {
                            addCurrentIndex(index);
                            addNotice(
                                noticeTo, noticeTitle, noticeContent, index);
                          }
                        });

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePageHOD()),
                        );
                      },
                      child: Text(
                        'Post Notice',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
        print('Clicked Settings');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SettingsHOD()));
        break;
      case 1:
        print('Clicked Sign Out');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginHOD()));
        break;
    }
  }

  void getDropDownItem() {
    setState(() {
      holder = dropdownValue;
    });
  }

  Future addNotice(String noticeTo, String noticeTitle, String noticeContent,
      int index) async {
    return await noticeListCollection.add({
      'to': noticeTo,
      'title': noticeTitle,
      'content': noticeContent,
      'index': index,
    });
  }

  Future addCurrentIndex(int index) async {
    return await noticeCollection.doc('Current Index').set({'index': index});
  }
}
