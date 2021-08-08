import 'package:flutter/material.dart';
import 'package:padvisor_app/screen/login_hod.dart';
import 'package:padvisor_app/screen/login_pa.dart';
import 'package:padvisor_app/screen/login_student.dart';

class ConfirmationStaff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xfff56476)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginStudent()),
                      ),
                  child: Text('Login as Student')),
            ),
            Container(
              width: 250,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xfff56476)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPA()),
                      ),
                  child: Text('Login as PA')),
            ),
            Container(
              width: 250,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xfff56476)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginHOD()),
                      ),
                  child: Text('Login as HOD / PA Coordinator')),
            ),
          ],
        ),
      ),
    );
  }
}
