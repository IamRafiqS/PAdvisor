import 'package:flutter/material.dart';
import 'package:padvisor_app/screen/hod_or_pa.dart';
import 'package:padvisor_app/screen/login_student.dart';
import 'package:padvisor_app/screen/messageForm.dart';
import 'package:padvisor_app/screen/profile_student.dart';
import 'package:padvisor_app/screen/upload.dart';
import 'package:padvisor_app/screen/viewProfileStaff.dart';

class Dashboard extends StatelessWidget {
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
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
        child: Column(
          children: [
            Spacer(),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              width: 300,
              height: 95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.message_outlined),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MessageForm()),
                            );
                          },
                        ),
                        Text(
                          'Message',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xfff56476),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.upload_rounded),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Upload()),
                            );
                          },
                        ),
                        Text(
                          'Upload',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xfff56476),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.school_rounded),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewProfileStaff()),
                            );
                          },
                        ),
                        Text(
                          'Advisor',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xfff56476),
                          ),
                        )
                      ],
                    ),
                  ]),
            ),
            Spacer(),
            Container(
              width: 300,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Column(
                  children: [
                    Text(
                      'Notice',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xfff56476),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
