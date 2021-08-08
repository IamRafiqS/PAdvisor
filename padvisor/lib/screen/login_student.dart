import 'package:flutter/material.dart';
import 'package:padvisor/Services/auth_student.dart';
import 'package:padvisor/Services/loading.dart';
import 'package:padvisor/screen/hodorpa.dart';
import 'package:padvisor/screen/login_pa.dart';
import 'package:padvisor/screen/student_screen/homepage_student.dart';
import 'package:padvisor/screen/student_screen/register_student.dart';

class LoginStudent extends StatefulWidget {
  @override
  _LoginStudentState createState() => _LoginStudentState();
}

class _LoginStudentState extends State<LoginStudent> {
  final _formKey = GlobalKey<FormState>();

  String email;

  String password;
  bool isLoading = false;

  final _controllerEmail = TextEditingController();

  final _controllerPw = TextEditingController();

  final AuthStudentService _auth = AuthStudentService();

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : Scaffold(
            body: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(flex: 2, child: Image.asset('assets/logo_upm.jpg')),
                  Flexible(
                      flex: 2,
                      child: Text(
                        'PAdvisor',
                        style: TextStyle(
                            fontSize: 27,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      )),
                  Flexible(
                      flex: 2,
                      child: TextFormField(
                          controller: _controllerEmail,
                          validator: (val) =>
                              val.isEmpty ? 'Email cannot be empty' : null,
                          decoration: InputDecoration(labelText: 'E-mail'))),
                  Flexible(
                    flex: 2,
                    child: TextFormField(
                      controller: _controllerPw,
                      validator: (val) =>
                          val.isEmpty ? 'Password cannot be empty' : null,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        email = _controllerEmail.text;
                        password = _controllerPw.text;

                        dynamic result =
                            await _auth.signInStudent(email, password);

                        if (result != null) {
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePageStudent()));
                        } else {
                          isLoading = false;
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Invalid Login')));
                        }
                      }
                    },
                    child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text('LOGIN')),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                  ),
                  words(context)
                ],
              ),
            ),
          ));
  }

  Widget words(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => hodorpa()),
              );
            },
            child: Text('Not a Student ?')),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterStudent()),
              );
            },
            child: Text('Register a new Student'))
      ],
    );
  }
}
