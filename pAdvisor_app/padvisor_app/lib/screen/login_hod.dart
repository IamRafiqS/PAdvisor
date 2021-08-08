import 'package:flutter/material.dart';
import 'package:padvisor_app/screen/dashboard_hod.dart';
import 'package:padvisor_app/screen/hod_or_pa.dart';

class LoginHOD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Text(
                    'PAdvisor',
                    style: TextStyle(
                      fontFamily: 'Inknut Antiqua',
                      fontSize: 50,
                      color: Color(0xff7d82b8),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                      width: 200.0,
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Staff Id'),
                      ),
                    ),
                    Container(
                      width: 200.0,
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Password'),
                      ),
                    ),
                    Container(
                      width: 200.0,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xfff56476)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))),
                          onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashboardHOD()),
                              ),
                          child: Text('Login')),
                    ),
                    Container(
                      child: TextButton(
                          onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ConfirmationStaff()),
                              ),
                          child: Text('Not a Coordinator?')),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
