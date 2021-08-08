import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';

class fillForm extends StatefulWidget {
  @override
  _fillFormState createState() => _fillFormState();
}

class _fillFormState extends State<fillForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAdvisor'),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              child: Text(
                'Academic Advisory Form',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: Text('Download Form'),
                onPressed: () async {
                  final status = Permission.storage.request();

                  if (await status.isGranted) {
                    final externalDir = await getExternalStorageDirectory();

                    final id = await FlutterDownloader.enqueue(
                      url: null,
                      //"https://drive.google.com/uc?export=download&id=1cSIkzFVbWVH2WnBcrr67BehpADdnS2FS",
                      //"https://firebasestorage.googleapis.com/v0/b/storage-3cff8.appspot.com/o/2020-05-29%2007-18-34.mp4?alt=media&token=841fffde-2b83-430c-87c3-2d2fd658fd41",
                      savedDir: externalDir.path,
                      fileName: "download",
                      showNotification: true,
                      openFileFromNotification: true,
                    );
                  } else {
                    print("Permission denied");
                  }
                },
              ),
            )
            // textColor('Course (If related): '),
            // Container(
            //   padding: EdgeInsets.only(left: 20, right: 20, top: 15),
            //   child: TextField(
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(), labelText: 'Course Name'),
            //   ),
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // textColor('Problem Category: '),
            // ListTile(
            //   title: Text('Academic Problem'),
            //   leading: Radio(
            //       value: 0,
            //       groupValue: _selectedValueCategory,
            //       onChanged: (value) {
            //         setState(() {
            //           _selectedValueCategory = value;
            //         });
            //       }),
            // ),
            // ListTile(
            //   title: Text('Non-Academic Problem'),
            //   leading: Radio(
            //       value: 1,
            //       groupValue: _selectedValueCategory,
            //       onChanged: (value) {
            //         setState(() {
            //           _selectedValueCategory = value;
            //         });
            //       }),
            // ),
            // Divider(
            //   indent: 10,
            //   thickness: 3,
            //   endIndent: 10,
            // ),
            // Container(
            //   padding:
            //       EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
            //   child: Text(
            //     'If student in a group, submit group members as an attachment',
            //     textAlign: TextAlign.center,
            //     style: TextStyle(fontSize: 14),
            //   ),
            // ),
            // Divider(
            //   indent: 10,
            //   thickness: 3,
            //   endIndent: 10,
            // ),
            // textColor('Problem faced: '),
            // ListTile(
            //   title: Text('Test 1 marks below 40 %'),
            //   leading: Radio(
            //       value: 0,
            //       groupValue: _selectedValueProblem,
            //       onChanged: (value) {
            //         setState(() {
            //           _selectedValueProblem = value;
            //         });
            //       }),
            // ),
            // ListTile(
            //   title: Text('Lecture Attendance below 80 %'),
            //   leading: Radio(
            //       value: 1,
            //       groupValue: _selectedValueProblem,
            //       onChanged: (value) {
            //         setState(() {
            //           _selectedValueProblem = value;
            //         });
            //       }),
            // ),
            // ListTile(
            //   title: Text('CGPA below 2.50 '),
            //   leading: Radio(
            //       value: 2,
            //       groupValue: _selectedValueProblem,
            //       onChanged: (value) {
            //         setState(() {
            //           _selectedValueProblem = value;
            //         });
            //       }),
            // ),
            // ListTile(
            //   title: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text('Other Problem'),
            //       TextField(
            //         decoration: InputDecoration(labelText: 'State Problem'),
            //       )
            //     ],
            //   ),
            //   leading: Radio(
            //       value: 3,
            //       groupValue: _selectedValueProblem,
            //       onChanged: (value) {
            //         setState(() {
            //           _selectedValueProblem = value;
            //         });
            //       }),
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // textColor('Discussion Summary: '),
            // Container(
            //     padding:
            //         EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 15),
            //     child: TextField(
            //       maxLines: null,
            //       decoration: InputDecoration(
            //           border: OutlineInputBorder(),
            //           //labelText: 'Write here',
            //           contentPadding: EdgeInsets.symmetric(vertical: 40)),
            //     )),
            // textColor('Date of Discussion: '),
            // Container(
            //     padding: EdgeInsets.only(top: 10, left: 25, right: 25),
            //     child: TextField(
            //         //decoration: InputDecoration(labelText: 'Date'),
            //         )),
            // Divider(
            //   height: 30,
            //   indent: 10,
            //   endIndent: 10,
            //   thickness: 3,
            // ),
            // textColor('State the Efficiency: '),
            // Container(
            //     padding: EdgeInsets.only(top: 10, left: 25, right: 25),
            //     child: TextField(
            //       maxLines: null,
            //       decoration: InputDecoration(
            //           border: OutlineInputBorder(),
            //           contentPadding: EdgeInsets.symmetric(vertical: 50)),
            //     )),
            // SizedBox(
            //   height: 10,
            // ),
            // textColor('Monitoring Date: '),
            // Container(
            //     padding: EdgeInsets.only(top: 5, left: 25, right: 25),
            //     child: TextField(
            //       //maxLines: null,
            //       decoration: InputDecoration(labelText: 'DD/MM/YYYY format'),
            //     )),
            // SizedBox(
            //   height: 20,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     ElevatedButton(
            //         style: ElevatedButton.styleFrom(primary: Colors.red),
            //         onPressed: () {},
            //         child: Text(
            //           'Download as PDF',
            //           style: TextStyle(color: Colors.white),
            //         )),
            //     ElevatedButton(
            //         style: ElevatedButton.styleFrom(primary: Colors.red),
            //         onPressed: () {},
            //         child: Text(
            //           'Print',
            //           style: TextStyle(color: Colors.white),
            //         ))
            //   ],
            // ),
            // SizedBox(
            //   height: 30,
            // )
          ],
        ),
      ),
    );
  }
}

Widget textColor(String name) {
  return Container(
    padding: EdgeInsets.only(left: 10),
    child: Text(
      name,
      style: TextStyle(
          fontSize: 17, fontWeight: FontWeight.bold, color: Colors.red),
    ),
  );
}
