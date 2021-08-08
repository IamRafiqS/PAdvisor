import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:padvisor/Services/database.dart';
import 'package:padvisor/screen/hod_screen/advisor_list.dart';
import 'package:padvisor/screen/hod_screen/message_hod.dart';
import 'package:padvisor/screen/hod_screen/notice_hod.dart';
import 'package:padvisor/screen/hod_screen/profile_hod.dart';
import 'package:padvisor/screen/hod_screen/settings_hod.dart';
import 'package:padvisor/screen/login_hod.dart';
import 'package:padvisor/screen/student_screen/courses_student.dart';
import 'package:padvisor/screen/student_screen/student_profile.dart';
import 'package:padvisor/screen/student_screen/student_view_advisor.dart';
import 'package:provider/provider.dart';

import '../login_student.dart';
import '../message.dart';
import '../notice.dart';

class HomePageHOD extends StatefulWidget {
  @override
  _HomePageHODState createState() => _HomePageHODState();
}

class _HomePageHODState extends State<HomePageHOD> {
  int _currentIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    NoticeHOD(),
    HODMessage(),
    ProfileHOD(),
    ListAdvisor()
  ];
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseServices().paData,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text('PAdvisor'),
          backgroundColor: Colors.grey,
          actions: [
            PopupMenuButton(
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                      PopupMenuItem(value: 0, child: textColor('Settings', 16)),
                      PopupMenuItem(value: 1, child: textColor('Sign Out', 16)),
                    ])
          ],
        ),
        body: _widgetOptions.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.red[400],
          selectedFontSize: 20,
          unselectedFontSize: 15,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'Message',
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.school_rounded),
                label: 'Advisors',
                backgroundColor: Colors.purple)
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }

  Widget noticeInfo(String title, String details) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          details,
          style: TextStyle(color: Colors.grey[600]),
        ),
        Divider(
          height: 10,
          thickness: 2,
          //color: Colors.amberAccent,
        )
      ],
    );
  }

  Widget textColor(String text, double size) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.red, fontSize: size, fontWeight: FontWeight.bold),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        print('Clicked Settings');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SettingsHOD()));
        break;
      case 1:
        print('Clicked Sign Out');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginHOD()));
        break;
    }
  }
}
