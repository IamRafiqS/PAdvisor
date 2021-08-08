import 'package:flutter/material.dart';
import 'package:padvisor/screen/advisee_list.dart';
import 'package:padvisor/screen/archive.dart';
import 'package:padvisor/screen/login_student.dart';
import 'package:padvisor/screen/message.dart';
import 'package:padvisor/screen/notice.dart';
import 'package:padvisor/screen/profile_pa.dart';
import 'package:padvisor/screen/setting_pa.dart';
import 'package:padvisor/screen/student_screen/courses_student.dart';
import 'package:padvisor/screen/student_screen/message_student.dart';
import 'package:padvisor/screen/student_screen/student_profile.dart';
import 'package:padvisor/screen/student_screen/student_view_advisor.dart';

class HomePageStudent extends StatefulWidget {
  @override
  _HomePageStudentState createState() => _HomePageStudentState();
}

class _HomePageStudentState extends State<HomePageStudent> {
  int _currentIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    notice(),
    StudentMessage(),
    ProfileStudent(),
    StudentViewPA()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAdvisor'),
        backgroundColor: Colors.grey,
        actions: [
          PopupMenuButton(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                    PopupMenuItem(value: 0, child: textColor('Courses', 16)),
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
              label: 'Advisor',
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
        print('Clicked Courses');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CoursesStudent()));
        break;
      case 1:
        print('Clicked Sign Out');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginStudent()));
        break;
    }
  }
}
