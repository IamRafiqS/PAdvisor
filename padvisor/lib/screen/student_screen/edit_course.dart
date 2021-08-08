import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:padvisor/Services/database.dart';
import 'package:padvisor/screen/course.dart';
import 'package:padvisor/screen/student_screen/courses_student.dart';

class EditCourse extends StatefulWidget {
  final courseCode;

  EditCourse({Key key, this.courseCode}) : super(key: key);

  @override
  _EditCourseState createState() => _EditCourseState();
}

class _EditCourseState extends State<EditCourse> {
  CollectionReference ref =
      FirebaseFirestore.instance.collection('StudentData');

  final _formKey = GlobalKey<FormState>();
  String id = FirebaseAuth.instance.currentUser.uid;

  String currentcCode;
  String currentcName;
  String currentlectName;
  String currentassessment1;
  String currentassessment2;
  String currentattendance;

  String initcCode;
  String initcName;
  String initlectName;
  String initassessment1;
  String initassessment2;
  String initattendance;

  String cCode;
  String cName;
  String lectName;
  String assessment1;
  String assessment2;
  String attendance;

  // Controllers
  final _controllerName = TextEditingController();
  final _controllerLectName = TextEditingController();
  final _controllerAssessment1 = TextEditingController();
  final _controllerAssessment2 = TextEditingController();
  final _controllerAttendance = TextEditingController();

  // Method to set course data
  void setVariable() {
    cName = _controllerName.text;
    lectName = _controllerLectName.text;
    assessment1 = _controllerAssessment1.text;
    assessment2 = _controllerAssessment2.text;
    attendance = _controllerAttendance.text;
  }

  void setInitValue() async {
    CollectionReference dataRef =
        FirebaseFirestore.instance.collection('StudentData');

    final courseData = await dataRef
        .doc(id)
        .collection('courses')
        .doc(widget.courseCode)
        .get();

    initcCode = courseData.get('courseCode');
    initcName = courseData.get('courseName');
    initlectName = courseData.get('lecturerName');
    initassessment1 = courseData.get('assessment1');
    initassessment2 = courseData.get('assessment2');
    initattendance = courseData.get('attendance');

    _controllerName.text = initcName;
    _controllerLectName.text = initlectName;
    _controllerAssessment1.text = initassessment1;
    _controllerAssessment2.text = initassessment2;
    _controllerAttendance.text = initattendance;
  }

  Future setValue() async {
    CollectionReference dataRef =
        FirebaseFirestore.instance.collection('StudentData');

    final courseData = await dataRef
        .doc(id)
        .collection('courses')
        .doc(widget.courseCode)
        .get();

    currentcCode = courseData.get('courseCode');
    currentcName = courseData.get('courseName');
    currentlectName = courseData.get('lecturerName');
    currentassessment1 = courseData.get('assessment1');
    currentassessment2 = courseData.get('assessment2');
    currentattendance = courseData.get('attendance');

    _controllerName.text = currentcName;
    _controllerLectName.text = currentlectName;
    _controllerAssessment1.text = currentassessment1;
    _controllerAssessment2.text = currentassessment2;
    _controllerAttendance.text = currentattendance;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.courseCode);
    print(id);
    //setInitValue();
    setValue();
    return Scaffold(
      appBar: AppBar(
        title: Text('PAdvisor'),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Text(
                  'Course',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              contained('Course Name: ', initcName, _controllerName),
              contained('Lecturer Name: ', initlectName, _controllerLectName),
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Text(
                  'Test Result',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              contained(
                  'Assessment 1', initassessment1, _controllerAssessment1),
              contained(
                  'Assessment 2', initassessment2, _controllerAssessment2),
              Divider(
                indent: 10,
                thickness: 2,
                endIndent: 10,
              ),
              //Attendance
              attendanceContained(
                  'Attendance', initattendance, _controllerAttendance),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      //_formKey.currentState.save();
                      setVariable();

                      //dynamic result = await _auth.signInStudent(email, password);
                      DatabaseServices(uid: id).editCourse(currentcCode, cName,
                          lectName, assessment1, assessment2, attendance);
                      Navigator.pop(
                        context,
                      );
                    }
                  },
                  child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text('Save Course')),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget attendanceContained(
    String titleAttendance, String details, TextEditingController controller) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.only(left: 20, top: 10, bottom: 5),
        alignment: Alignment.centerLeft,
        child: Text(
          titleAttendance,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
      Row(
        children: [
          Container(
            width: 50,
            padding: EdgeInsets.only(left: 20, bottom: 10),
            alignment: Alignment.centerLeft,
            child: TextFormField(
              controller: controller,
            ),
          ),
          Text('%'),
        ],
      ),
    ],
  );
}

Widget testResultContained(
    String titleTest, String details, TextEditingController controller) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.only(left: 20, top: 10, bottom: 5),
        alignment: Alignment.centerLeft,
        child: Text(
          titleTest,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
      Row(
        children: [
          Container(
            width: 50,
            padding: EdgeInsets.only(left: 20, bottom: 10),
            alignment: Alignment.centerLeft,
            child: TextField(
              decoration: InputDecoration(
                labelText: '',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text('/'),
          ),
          Container(
            width: 50,
            padding: EdgeInsets.only(left: 20, bottom: 10),
            alignment: Alignment.centerLeft,
            child: TextFormField(
              controller: controller,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget contained(
    String title, String details, TextEditingController controller) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.only(left: 20, top: 10, bottom: 5),
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        width: 350,
        padding: EdgeInsets.only(left: 20, bottom: 10),
        alignment: Alignment.centerLeft,
        child: TextFormField(
          controller: controller,
        ),
      ),
    ],
  );
}
