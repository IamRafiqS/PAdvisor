import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class viewCourse extends StatefulWidget {
  final courseCode;

  viewCourse({Key key, this.courseCode}) : super(key: key);

  @override
  _viewCourseState createState() => _viewCourseState();
}

class _viewCourseState extends State<viewCourse> {
  CollectionReference ref =
      FirebaseFirestore.instance.collection('StudentData');

  String id = FirebaseAuth.instance.currentUser.uid;

  String cCode;
  String cName;
  String lectName;
  String assessment1;
  String assessment2;
  String attendance;

  Future setValue() async {
    CollectionReference dataRef =
        FirebaseFirestore.instance.collection('StudentData');

    final courseData = await dataRef
        .doc(id)
        .collection('courses')
        .doc(widget.courseCode)
        .get();
    setState(() {
      cCode = courseData.get('courseCode');
      cName = courseData.get('courseName');
      lectName = courseData.get('lecturerName');
      assessment1 = courseData.get('assessment1');
      assessment2 = courseData.get('assessment2');
      attendance = courseData.get('attendance');
    });
  }

  @override
  Widget build(BuildContext context) {
    setValue();
    return Scaffold(
      appBar: AppBar(
        title: Text('PAdvisor'),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              'Course',
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          contained('Course Code:', cCode ?? ""),
          contained('Course Name: ', cName ?? ""),
          contained('Lecturer Name: ', lectName ?? ""),
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              'Test Result',
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          contained('Assessment 1', assessment1 ?? ""),
          contained('Assessment 2', assessment2 ?? ""),
          Divider(
            indent: 10,
            thickness: 3,
            endIndent: 10,
          ),
          contained('Attendance', attendance + "%" ?? "")
        ],
      ),
    );
  }
}

Widget contained(String title, String name) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
        alignment: Alignment.centerLeft,
        child: Text(
          name,
          style: TextStyle(color: Colors.black),
        ),
      ),
    ],
  );
}
