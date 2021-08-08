import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:padvisor/Services/auth_pa.dart';
import 'package:padvisor/Services/database.dart';

class registerpa extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final AuthPaService _auth = AuthPaService();

  final _controllerName = TextEditingController();
  final _controllerId = TextEditingController();
  final _controllerRoom = TextEditingController();
  final _controllerPhone = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerFaculty = TextEditingController();
  final _controllerDept = TextEditingController();
  final _controllerWechat = TextEditingController();
  final _controllerPw = TextEditingController();

  String name = '';
  String staffid = '';
  String room = '';
  String phone = '';
  String email = '';
  String faculty = '';
  String dept = '';
  String wechat = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
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
          child: SizedBox(
            height: 1050,
            width: 400,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Register',
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
                          validator: (val) =>
                              val.isEmpty ? 'Name cannot be empty' : null,
                          controller: _controllerName,
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
                          'Staff ID: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'ID cannot be empty' : null,
                          controller: _controllerId,
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
                          'Password: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'More than 6 characters'),
                          validator: (val) =>
                              val.isEmpty ? 'Password cannot be empty' : null,
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
                          validator: (val) =>
                              val.isEmpty ? 'Faculty cannot be empty' : null,
                          controller: _controllerFaculty,
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
                          'Department: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Department cannot be empty' : null,
                          controller: _controllerDept,
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
                          'Room No: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Room no. cannot be empty' : null,
                          controller: _controllerRoom,
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
                          'Phone No: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Phone no. cannot be empty' : null,
                          controller: _controllerPhone,
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
                          'Email: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Email cannot be empty' : null,
                          controller: _controllerEmail,
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
                          'weChat ID: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'WeChat ID cannot be empty' : null,
                          controller: _controllerWechat,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        name = _controllerName.text;
                        staffid = _controllerId.text;
                        room = _controllerRoom.text;
                        phone = _controllerPhone.text;
                        email = _controllerEmail.text;
                        faculty = _controllerFaculty.text;
                        dept = _controllerDept.text;
                        wechat = _controllerWechat.text;
                        password = _controllerPw.text;

                        dynamic result =
                            await _auth.registerPa(email, password);

                        DatabaseServices(uid: result.uid).registerUserData(
                            name,
                            password,
                            faculty,
                            dept,
                            room,
                            phone,
                            email,
                            wechat,
                            staffid);

                        print('User registered');
                        if (result != null) {
                          Navigator.pop(context);
                          print('Success Register');
                        }
                      } else {
                        print('Invalid Register');
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
    );
  }
}
