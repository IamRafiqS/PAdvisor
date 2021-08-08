import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:padvisor/Services/auth_student.dart';
import 'package:padvisor/Services/database.dart';
import 'courses_student.dart';

class AddCourse extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String id = FirebaseAuth.instance.currentUser.uid;

  String courseCode;
  String courseName;
  String lecturerName;
  String assessment1;
  String assessment2;
  String attendance;

  final AuthStudentService _auth = AuthStudentService();

  // Controller
  final _controllerCourseCode = TextEditingController();
  final _controllerCourseName = TextEditingController();
  final _controllerLecturerName = TextEditingController();
  final _controllerAssessment1 = TextEditingController();
  final _controllerAssessment2 = TextEditingController();
  final _controllerAttendance = TextEditingController();

  // Set Variable
  void setVariable() {
    courseCode = _controllerCourseCode.text;
    courseName = _controllerCourseName.text;
    lecturerName = _controllerLecturerName.text;
    assessment1 = _controllerAssessment1.text;
    assessment2 = _controllerAssessment2.text;
    attendance = _controllerAttendance.text;
  }

  @override
  Widget build(BuildContext context) {
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
              contained('Course Code', 'eg: SSE3151', _controllerCourseCode),
              contained('Course Name', 'eg: Mobile Development',
                  _controllerCourseName),
              contained("Lecturer's Name", '', _controllerLecturerName),
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
              testResultContained(
                  'Assessment 1', '_/20', _controllerAssessment1),
              testResultContained(
                  'Assessment 2', '_/20', _controllerAssessment2),
              Divider(
                indent: 10,
                thickness: 2,
                endIndent: 10,
              ),
              //Attendance
              attendanceContained('Attendance', _controllerAttendance),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      setVariable();

                      //dynamic result = await _auth.signInStudent(email, password);
                      DatabaseServices(uid: id).addCourse(
                          courseCode,
                          courseName,
                          lecturerName,
                          assessment1,
                          assessment2,
                          attendance);
                      Navigator.pop(
                        context,
                        // MaterialPageRoute(builder: (context) => LoginStudent()),
                      );
                    }
                  },
                  child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text('Add Course')),
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
    String titleAttendance, TextEditingController controller) {
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
              //validator: (val) => val.isEmpty ? 'Detail is required' : null,
              decoration: InputDecoration(
                labelText: '',
              ),
            ),
          ),
          Text('%'),
        ],
      ),
    ],
  );
}

Widget testResultContained(
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
          //validator: (val) => val.isEmpty ? 'Detail is required' : null,
          decoration: InputDecoration(
            labelText: details,
          ),
        ),
      ),
    ],
  );
}

/*
Widget testResultContained2(String titleTest) {
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
            child: TextField(
              decoration: InputDecoration(
                labelText: '',
              ),
            ),
          ),
        ],
      ),
    ],
  );
}*/

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
          validator: (val) => val.isEmpty ? 'Detail is required' : null,
          decoration: InputDecoration(
            labelText: details,
          ),
        ),
      ),
    ],
  );
}
