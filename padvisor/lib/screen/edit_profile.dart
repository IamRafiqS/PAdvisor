import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:padvisor/Services/database.dart';
import 'package:padvisor/model/pa_user.dart';

class editprofile extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String id = FirebaseAuth.instance.currentUser.uid;

  String name;
  String password;
  String staffId;
  String faculty;
  String dept;
  String room;
  String phone;
  String wechat;
  String email;

  String currentname;
  String currentpassword;
  String currentstaffId;
  String currentfaculty;
  String currentdept;
  String currentroom;
  String currentphone;
  String currentwechat;
  String currentemail;

  //controller
  final _controllerName = TextEditingController();
  final _controllerStaffID = TextEditingController();
  final _controllerFaculty = TextEditingController();
  final _controllerPw = TextEditingController();
  final _controllerDept = TextEditingController();
  final _controllerRoom = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPhone = TextEditingController();
  final _controllerWechat = TextEditingController();

// method to set data from textformfield into variable
  void setVariable() {
    name = _controllerName.text;
    staffId = _controllerStaffID.text;
    faculty = _controllerFaculty.text;
    password = _controllerPw.text;
    dept = _controllerDept.text;
    room = _controllerRoom.text;
    phone = _controllerPhone.text;
    email = _controllerEmail.text;
    wechat = _controllerWechat.text;
  }

  Future setValue() async {
    CollectionReference dataRef =
        FirebaseFirestore.instance.collection('paData');

    final paData = await dataRef.doc(id).get();

    currentname = paData.get('name');
    currentpassword = paData.get('password');
    currentstaffId = paData.get('StaffId');
    currentfaculty = paData.get('faculty');
    currentdept = paData.get('department');
    currentroom = paData.get('roomNo');
    currentphone = paData.get('phone num');
    currentwechat = paData.get('wechatid');
    currentemail = paData.get('email');

    _controllerName.text = currentname;
    _controllerPw.text = currentpassword;
    _controllerStaffID.text = currentstaffId;
    _controllerFaculty.text = currentfaculty;
    _controllerDept.text = currentdept;
    _controllerRoom.text = currentroom;
    _controllerPhone.text = currentphone;
    _controllerWechat.text = currentwechat;
    _controllerEmail.text = currentemail;
  }

  paUser pa;

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
                Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
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
                            labelText: 'Edit your name',
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Staff ID: ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                          controller: _controllerStaffID,
                          decoration: InputDecoration(
                            labelText: 'Edit your staff ID',
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password: ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'More than 6 characters',
                          labelText: 'Change your Password',
                        ),
                        controller: _controllerPw,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Faculty: ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                          controller: _controllerFaculty,
                          decoration: InputDecoration(
                            labelText: 'Enter your Faculty ',
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Department: ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                          controller: _controllerDept,
                          decoration: InputDecoration(
                            labelText: 'Enter your Department ',
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Room No: ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                          controller: _controllerRoom,
                          decoration: InputDecoration(
                            labelText: 'Enter your Room no. ',
                          )),
                    ],
                  ),
                ),
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
                            labelText: 'Edit your Phone no. ',
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email: ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                          controller: _controllerEmail,
                          decoration: InputDecoration(
                            labelText: 'Enter new E-mail ',
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'weChat ID: ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                          controller: _controllerWechat,
                          decoration: InputDecoration(
                            labelText: 'Edit your WeChat ID. ',
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
                      DatabaseServices(uid: id).updateUserData(name, password,
                          faculty, dept, room, phone, email, wechat, staffId);
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget regDetail(BuildContext context, String title, String details) {
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

  Widget regForm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        regDetail(context, 'Name: ', 'Enter your Name'),
        regDetail(context, 'Staff ID:  ', 'Enter your Staff ID'),
        regDetail(context, 'Room No: ', 'Enter your Room No'),
        regDetail(context, 'IC/Passport No: ', 'Enter your IC/Passport'),
        regDetail(context, 'Telephone No: ', 'Enter your Telephone No'),
        regDetail(context, 'Email: ', 'Enter your Email'),
      ],
    );
  }
}
