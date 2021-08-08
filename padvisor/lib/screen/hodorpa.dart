import 'package:flutter/material.dart';
import 'package:padvisor/screen/login_hod.dart';
import 'package:padvisor/screen/login_student.dart';
import 'login_pa.dart';

class hodorpa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(flex: 4, child: Image.asset('assets/logo_upm.jpg')),
                Flexible(
                    flex: 2,
                    child: Text(
                      'PAdvisor',
                      style: TextStyle(
                          fontSize: 27,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    )),
                //buttonLogin('LOGIN as Student'),
                Flexible(
                    flex: 2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          minimumSize: Size(150, 32),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18))),
                      child: Text('LOGIN as Student'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginStudent()));
                      },
                    )),
                // buttonLogin('Login as PA'),
                Flexible(
                    flex: 2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          minimumSize: Size(150, 32),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18))),
                      child: Text('LOGIN as PA'),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => loginpa()));
                      },
                    )),
                Flexible(
                    flex: 2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          minimumSize: Size(150, 32),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18))),
                      child: Text('LOGIN as HOD'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginHOD()));
                      },
                    )),
                //buttonLogin('LOGIN as HOD')
              ])),
    );
  }
}

Widget buttonLogin(
  String info,
) {
  return Flexible(
      //flex: 2,
      child: Container(
    padding: EdgeInsets.all(15),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.red,
          minimumSize: Size(150, 32),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
      child: Text(info),
      onPressed: () {},
    ),
  ));
}
