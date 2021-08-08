import 'package:flutter/material.dart';
import 'package:padvisor_app/screen/dashboard_student.dart';
import 'package:padvisor_app/screen/hod_or_pa.dart';
import 'package:padvisor_app/screen/login_student.dart';
import 'package:padvisor_app/screen/profile_student.dart';

class Upload extends StatelessWidget {
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        print('Clicked Profile');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileStudent()),
        );
        break;
      case 1:
        print('Clicked Report Form');
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ConfirmationStaff()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffb97397),
      appBar: AppBar(
        title: Text('PAdvisor'),
        actions: [
          PopupMenuButton<int>(
              onSelected: (item) => onSelected(context, item),
              icon: Icon(Icons.menu),
              itemBuilder: (context) => [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          color: Color(0xfff56476),
                        ),
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: Text(
                        'Report Form',
                        style: TextStyle(
                          color: Color(0xfff56476),
                        ),
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 2,
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Color(0xfff56476),
                        ),
                      ),
                    ),
                  ]),
        ],
      ),
      body: Center(
        child: Container(
          width: 340,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(
              children: [
                Text(
                  'Upload Report Form',
                  style: TextStyle(
                    color: Color(0xfff56476),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  width: 100,
                  height: 100,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.upload_rounded,
                      size: 80,
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xfff56476)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()),
                          ),
                      child: Text('Upload')),
                ),
                const Divider(
                  height: 20,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    'Uploaded Documents',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
