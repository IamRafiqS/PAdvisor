import 'package:flutter/material.dart';
import 'package:padvisor/Services/auth_hod.dart';
import 'package:padvisor/Services/loading.dart';
import 'package:padvisor/screen/hod_screen/homepage_hod.dart';
import 'package:padvisor/screen/hod_screen/register_hod.dart';
import 'package:padvisor/screen/homepage_pa.dart';
import 'hodorpa.dart';
import 'register_pa.dart';

class LoginHOD extends StatefulWidget {
  @override
  _LoginHODState createState() => _LoginHODState();
}

class _LoginHODState extends State<LoginHOD> {
  final _formKey = GlobalKey<FormState>();

  final AuthHodService _auth = AuthHodService();

  String email;

  String password;
  bool isLoading = false;

  final _controllerEmail = TextEditingController();

  final _controllerPw = TextEditingController();

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
                              val.isEmpty ? 'This field cannot be empty' : null,
                          decoration: InputDecoration(labelText: 'E-mail'))),
                  Flexible(
                    flex: 2,
                    child: TextFormField(
                      controller: _controllerPw,
                      validator: (val) =>
                          val.isEmpty ? 'This field cannot be empty' : null,
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

                        dynamic result = await _auth.signInHod(email, password);

                        if (result != null) {
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePageHOD()));
                        } else {
                          setState(() {
                            isLoading = false;
                          });
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
            child: Text('Not a HoD/PA Coordinator ?')),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterHOD()),
              );
            },
            child: Text('Register a new HoD/PA Coordinator'))
      ],
    );
  }
}
