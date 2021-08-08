import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:padvisor/Services/database.dart';

import '../../Services/database.dart';
import '../../model/student_user.dart';

class StudentEditProfile extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  String id = FirebaseAuth.instance.currentUser.uid;

  String name;
  String matric;
  String password;
  String ic;
  String sem;
  String cohort;
  String phone;
  String email;
  String wechat;

  String currentname;
  String currentmatric;
  String currentpassword;
  String currentic;
  String currentsem;
  String currentcohort;
  String currentphone;
  String currentemail;
  String currentwechat;

  //controller
  final _controllerName = TextEditingController();
  final _controllerMatric = TextEditingController();
  final _controllerPw = TextEditingController();
  final _controllerIc = TextEditingController();
  final _controllerSem = TextEditingController();
  final _controllerCohort = TextEditingController();
  final _controllerPhone = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerWechat = TextEditingController();

// method to set data from textformfield into variable
  void setVariable() {
    name = _controllerName.text;
    matric = _controllerMatric.text;
    password = _controllerPw.text;
    ic = _controllerIc.text;
    sem = _controllerSem.text;
    cohort = _controllerCohort.text;
    phone = _controllerPhone.text;
    email = _controllerEmail.text;
    wechat = _controllerWechat.text;
  }

  Future setValue() async {
    CollectionReference dataRef =
        FirebaseFirestore.instance.collection('StudentData');

    final studentData = await dataRef.doc(id).get();

    currentname = studentData.get('name');
    currentmatric = studentData.get('MatricNo');
    currentpassword = studentData.get('password');
    currentic = studentData.get('IC');
    currentsem = studentData.get('Semester');
    currentcohort = studentData.get('Cohort');
    currentphone = studentData.get('phone num');
    currentemail = studentData.get('email');
    currentwechat = studentData.get('wechatid');

    _controllerName.text = currentname;
    _controllerMatric.text = currentmatric;
    _controllerPw.text = currentpassword;
    _controllerIc.text = currentic;
    _controllerSem.text = currentsem;
    _controllerCohort.text = currentcohort;
    _controllerPhone.text = currentphone;
    _controllerEmail.text = currentemail;
    _controllerWechat.text = currentwechat;
  }

  studentUser student;

  @override
  Widget build(BuildContext context) {
    setValue();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text(
            'PAdvisor',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Edit profile',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                            controller: _controllerName,
                            decoration: InputDecoration(
                              labelText: 'Enter your name',
                            )),
                      ],
                    ),
                  ),
                  //
                  // Enter Matric No
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Matric No: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                            controller: _controllerMatric,
                            decoration: InputDecoration(
                              labelText: 'Enter Matric no',
                            )),
                      ],
                    ),
                  ),
                  //
                  // Enter password
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                            controller: _controllerPw,
                            decoration: InputDecoration(
                              hintText: 'more than 6 characters',
                              labelText: 'Enter your Password',
                            )),
                      ],
                    ),
                  ),
                  //
                  // Enter IC/Passport
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'IC/Passport no:',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                            controller: _controllerIc,
                            decoration: InputDecoration(
                              labelText: 'Enter IC/Passport ',
                            )),
                      ],
                    ),
                  ),
                  //
                  // Enter Semester Session
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Semester Session',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                            controller: _controllerSem,
                            decoration: InputDecoration(
                              labelText: 'eg. 2020/2021-2',
                            )),
                      ],
                    ),
                  ),
                  //
                  // Enter Cohort
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cohort: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                            controller: _controllerCohort,
                            decoration: InputDecoration(
                              labelText: 'eg. 2019/2023',
                            )),
                      ],
                    ),
                  ),
                  //
                  // Enter Phone
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone No: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                            controller: _controllerPhone,
                            decoration: InputDecoration(
                              labelText: 'Enter your phone No.',
                            )),
                      ],
                    ),
                  ),
                  //
                  // Enter email
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'E-mail: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                            controller: _controllerEmail,
                            decoration: InputDecoration(
                              labelText: 'Enter e-mail',
                            )),
                      ],
                    ),
                  ),
                  //
                  // Enter WeChat ID
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'WeChat ID: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                            controller: _controllerWechat,
                            decoration: InputDecoration(
                              labelText: 'Enter WeChat ID ',
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        setVariable();

                        //dynamic result = await _auth.signInStudent(email, password);
                        DatabaseServices(uid: id).updateStudentData(
                            name,
                            matric,
                            password,
                            ic,
                            sem,
                            cohort,
                            phone,
                            email,
                            wechat);
                        Navigator.pop(
                          context,
                          // MaterialPageRoute(builder: (context) => LoginStudent()),
                        );
                      }
                    },
                    child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Text('Save')),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget editDetail(BuildContext context, String title, String details) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          TextField(
              decoration: InputDecoration(
            labelText: details,
          )),
        ],
      ),
    );
  }

  Widget editSemDetail(BuildContext context, String title, String details) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Container(
                width: 50,
                padding: EdgeInsets.only(right: 10),
                child: TextField(
                    decoration: InputDecoration(
                  labelText: details,
                )),
              ),
              Text('/'),
              Container(
                width: 50,
                padding: EdgeInsets.only(right: 10, left: 10),
                child: TextField(
                    decoration: InputDecoration(
                  labelText: details,
                )),
              ),
              Text('-'),
              Container(
                padding: EdgeInsets.only(left: 10),
                width: 50,
                child: TextField(
                    decoration: InputDecoration(
                  labelText: '',
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget editCohortDetail(BuildContext context, String title, String details) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Container(
                width: 50,
                padding: EdgeInsets.only(right: 10),
                child: TextField(
                    decoration: InputDecoration(
                  labelText: details,
                )),
              ),
              Text('/'),
              Container(
                width: 50,
                padding: EdgeInsets.only(right: 10, left: 10),
                child: TextField(
                    decoration: InputDecoration(
                  labelText: details,
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget regForm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        editDetail(context, 'Name: ', 'Enter your Name'),
        editDetail(context, 'Matric No:  ', 'Enter your Matric No'),
        editDetail(context, 'IC/Passport No: ', 'Enter your IC/Passport'),
        editSemDetail(context, 'Semester Session: ', '20**'),
        editCohortDetail(context, 'Cohort: ', '20**'),
        editDetail(context, 'Telephone No: ', 'Enter your Telephone No'),
        editDetail(context, 'Email: ', 'Enter your Email'),
        editDetail(context, 'WeChat ID: ', 'Enter WeChat ID'),
      ],
    );
  }
}
