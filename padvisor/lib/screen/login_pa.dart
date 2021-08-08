import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:padvisor/Services/auth_pa.dart';
import 'package:padvisor/Services/loading.dart';
import 'package:padvisor/model/pa_user.dart';
import 'package:padvisor/screen/hodorpa.dart';
import 'package:padvisor/screen/homepage_pa.dart';
import 'package:padvisor/screen/register_pa.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:padvisor/wrapper.dart';
import 'package:provider/provider.dart';

class loginpa extends StatefulWidget {
  @override
  _loginpaState createState() => _loginpaState();
}

class _loginpaState extends State<loginpa> {
  final CollectionReference paCollection =
      FirebaseFirestore.instance.collection('pa');

  final _controllerId = TextEditingController();

  final _controllerPw = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final AuthPaService _auth = AuthPaService();

  String id;

  String password;

  String pw;

  dynamic data;

  bool isLoading = false;

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
                          controller: _controllerId,
                          validator: (val) =>
                              val.isEmpty ? 'E-mail cannot be empty' : null,
                          decoration: InputDecoration(labelText: 'E-Mail'))),
                  Flexible(
                    flex: 2,
                    child: TextFormField(
                      controller: _controllerPw,
                      obscureText: true,
                      validator: (val) =>
                          val.isEmpty ? 'Password cannot be empty' : null,
                      decoration: InputDecoration(labelText: 'Password'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        id = _controllerId.text;
                        password = _controllerPw.text;
                        dynamic result = await _auth.signInPa(id, password);

                        if (result != null) {
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => homepagepa()));
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Invalid Login')));
                        }

                        // if (paCollection.doc(id) != null) {
                        //   await paCollection.doc(id).get().then((DocumentSnapshot ds) {
                        //     data = ds.data();
                        //     pw = data['password'];
                        //   });
                        //   if (pw == password) {
                        //     paUser user = _saveUserData(id);
                        //     print(user.id);
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(builder: (context) => homepagepa()),
                        //     );
                        //   } else {
                        //     ScaffoldMessenger.of(context)
                        //         .showSnackBar(SnackBar(content: Text('Invalid Login')));
                        //   }
                        // } else {
                        //   ScaffoldMessenger.of(context)
                        //       .showSnackBar(SnackBar(content: Text('Invalid Login')));
                        // }
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
                  context, MaterialPageRoute(builder: (context) => hodorpa()));
            },
            child: Text('Not an Advisor ?')),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => registerpa()),
              );
            },
            child: Text('Register a new Advisor'))
      ],
    );
  }
}

// // convert id from firestore into paUser model
// paUser _saveUserData(String id) {
//   return id != null ? paUser(id: id) : null;
// }
