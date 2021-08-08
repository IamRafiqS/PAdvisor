import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:padvisor/Services/database.dart';
import 'package:padvisor/model/hod_user.dart';

class EditProfileHOD extends StatefulWidget {
  @override
  _EditProfileHODState createState() => _EditProfileHODState();
}

class _EditProfileHODState extends State<EditProfileHOD> {
  final _formKey = GlobalKey<FormState>();

  String id = FirebaseAuth.instance.currentUser.uid;

  String name;
  String staffId;
  String password;
  String phone;
  String faculty;
  String dept;
  String room;
  String email;
  String wechat;

  String currentname;
  String currentstaffId;
  String currentpassword;
  String currentphone;
  String currentfaculty;
  String currentdept;
  String currentroom;
  String currentemail;
  String currentwechat;

  //controller
  final _controllerName = TextEditingController();
  final _controllerStaffID = TextEditingController();
  final _controllerPw = TextEditingController();
  final _controllerFaculty = TextEditingController();
  final _controllerDepartment = TextEditingController();
  final _controllerRoomNo = TextEditingController();
  final _controllerPhone = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerWechat = TextEditingController();

// method to set data from textformfield into variable
  void setVariable() {
    name = _controllerName.text;
    staffId = _controllerStaffID.text;
    password = _controllerPw.text;
    faculty = _controllerFaculty.text;
    dept = _controllerDepartment.text;
    room = _controllerRoomNo.text;
    phone = _controllerPhone.text;
    email = _controllerEmail.text;
    wechat = _controllerWechat.text;
  }

  Future setValue() async {
    CollectionReference dataRef =
        FirebaseFirestore.instance.collection('hodData');

    final hodData = await dataRef.doc(id).get();

    currentname = hodData.get('name');
    currentstaffId = hodData.get('StaffId');
    currentpassword = hodData.get('password');
    currentphone = hodData.get('phone num');
    currentfaculty = hodData.get('faculty');
    currentdept = hodData.get('department');
    currentroom = hodData.get('roomNo');
    currentemail = hodData.get('email');
    currentwechat = hodData.get('wechatid');

    _controllerName.text = currentname;
    _controllerStaffID.text = currentstaffId;
    _controllerPw.text = currentpassword;
    _controllerFaculty.text = currentfaculty;
    _controllerDepartment.text = currentdept;
    _controllerRoomNo.text = currentroom;
    _controllerPhone.text = currentphone;
    _controllerEmail.text = currentemail;
    _controllerWechat.text = currentwechat;
  }

  hodUser hod;

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
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 1200,
            width: 400,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Text('Edit profile',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                    // Enter name
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
                                labelText: 'Edit your name ',
                              )),
                        ],
                      ),
                    ),
                    //
                    // Enter staff id
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
                    //
                    // Enter password
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
                              controller: _controllerPw,
                              decoration: InputDecoration(
                                hintText: 'More than 6 characters',
                                labelText: 'Change your Password',
                              )),
                        ],
                      ),
                    ),
                    //
                    // Enter phone
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Phone No.: ',
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
                    //
                    // Enter faculty
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Faculty : ',
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
                    //
                    // Enter dept
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
                              controller: _controllerDepartment,
                              decoration: InputDecoration(
                                labelText: 'Enter your Department ',
                              )),
                        ],
                      ),
                    ),
                    //
                    // Enter room no
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Room No.: ',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                              controller: _controllerRoomNo,
                              decoration: InputDecoration(
                                labelText: 'Enter your Room no. ',
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
                                labelText: 'Enter new E-mail ',
                              )),
                        ],
                      ),
                    ),
                    //
                    // Enter wechat
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
                          DatabaseServices(uid: id).updateHodData(
                              name,
                              staffId,
                              password,
                              phone,
                              faculty,
                              dept,
                              room,
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
          ),
        ),
      ),
    );
  }

  Widget editDetail(BuildContext context, String title, String details,
      TextEditingController controller) {
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
        editDetail(context, 'Name: ', 'Enter your name', _controllerName),
        editDetail(
            context, 'Staff ID:  ', 'Enter new Staff ID', _controllerStaffID),
        editDetail(
            context, 'Room No: ', 'Enter new Room No', _controllerRoomNo),
        editDetail(
            context, 'Faculty: ', 'Enter new Faculty', _controllerFaculty),
        editDetail(context, 'Department: ', 'Enter new Department',
            _controllerDepartment),
        editDetail(
            context, 'Phone No.: ', 'Enter new Phone No. ', _controllerPhone),
        editDetail(context, 'Email: ', 'Enter new Email', _controllerEmail),
        editDetail(context, 'Password: ', 'Enter new password', _controllerPw),
        editDetail(
            context, 'WeChat ID: ', 'Enter new WeChat ID', _controllerWechat),
      ],
    );
  }
}
