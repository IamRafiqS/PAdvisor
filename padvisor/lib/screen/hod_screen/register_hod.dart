import 'package:flutter/material.dart';
import 'package:padvisor/Services/auth_hod.dart';
import 'package:padvisor/Services/database.dart';

import '../login_hod.dart';

class RegisterHOD extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final AuthHodService _auth = AuthHodService();

  //Variables
  String name;
  String staffid;
  String password;
  String phone;
  String faculty;
  String dept;
  String room;
  String email;
  String wechat;

  //define controllers
  final _controllerName = TextEditingController();
  final _controllerStaffId = TextEditingController();
  final _controllerPw = TextEditingController();
  final _controllerPhone = TextEditingController();
  final _controllerFaculty = TextEditingController();
  final _controllerDept = TextEditingController();
  final _controllerRoom = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerWechat = TextEditingController();

  // method to assign value from controller to variable
  void setValue() {
    name = _controllerName.text;
    staffid = _controllerStaffId.text;
    password = _controllerPw.text;
    phone = _controllerPhone.text;
    faculty = _controllerFaculty.text;
    dept = _controllerDept.text;
    room = _controllerRoom.text;
    email = _controllerEmail.text;
    wechat = _controllerWechat.text;
  }

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
      body: SingleChildScrollView(
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
                    child: Text('Register',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                  //regForm(context),
                  //
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
                            validator: (val) => val.isEmpty
                                ? 'This field cannot be empty'
                                : null,
                            decoration: InputDecoration(
                              labelText: 'Enter your name ',
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
                            controller: _controllerStaffId,
                            validator: (val) => val.isEmpty
                                ? 'This field cannot be empty'
                                : null,
                            decoration: InputDecoration(
                              labelText: 'Enter your staff ID',
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
                            validator: (val) => val.isEmpty
                                ? 'This field cannot be empty'
                                : null,
                            decoration: InputDecoration(
                              hintText: 'more than 6 characters',
                              labelText: 'Enter your Password',
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
                            validator: (val) => val.isEmpty
                                ? 'This field cannot be empty'
                                : null,
                            decoration: InputDecoration(
                              labelText: 'Enter your Phone no. ',
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
                            validator: (val) => val.isEmpty
                                ? 'This field cannot be empty'
                                : null,
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
                            controller: _controllerDept,
                            validator: (val) => val.isEmpty
                                ? 'This field cannot be empty'
                                : null,
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
                            controller: _controllerRoom,
                            validator: (val) => val.isEmpty
                                ? 'This field cannot be empty'
                                : null,
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
                            validator: (val) => val.isEmpty
                                ? 'This field cannot be empty'
                                : null,
                            decoration: InputDecoration(
                              labelText: 'Enter your E-mail ',
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
                            validator: (val) => val.isEmpty
                                ? 'This field cannot be empty'
                                : null,
                            decoration: InputDecoration(
                              labelText: 'Enter your WeChat ID. ',
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
                        setValue();
                        print(name + ' ' + staffid + ' ' + password);
                        print(phone + ' ' + faculty + ' ' + dept);
                        print(room + ' ' + email + ' ' + wechat);

                        dynamic result =
                            await _auth.registerHod(email, password);
                        DatabaseServices(uid: result.uid).registerHodData(
                            name,
                            staffid,
                            password,
                            phone,
                            faculty,
                            dept,
                            room,
                            email,
                            wechat);

                        if (result != null) {
                          print('Succesfully register');
                          Navigator.pop(
                            context,
                          );
                        } else {
                          print('error occured');
                        }
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
}
