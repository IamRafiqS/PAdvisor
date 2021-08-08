import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:padvisor/Services/auth_pa.dart';
import 'package:padvisor/Services/database.dart';
import 'package:padvisor/model/list_advisee.dart';
import 'package:padvisor/screen/add_advisee.dart';
import 'package:padvisor/screen/advisee_list.dart';
import 'package:padvisor/screen/archive.dart';
import 'package:padvisor/screen/message.dart';
import 'package:padvisor/screen/notice.dart';
import 'package:padvisor/screen/profile_pa.dart';
import 'package:padvisor/screen/setting_pa.dart';
import 'package:provider/provider.dart';

class homepagepa extends StatefulWidget {
  @override
  _homepagepaState createState() => _homepagepaState();
}

class _homepagepaState extends State<homepagepa> {
  int _currentIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    notice(),
    message(),
    Profilepa(),
    adviseeList()
  ];

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: FirebaseAuth.instance.authStateChanges(),
      initialData: null,
      child: StreamProvider<QuerySnapshot>.value(
        value: DatabaseServices(uid: FirebaseAuth.instance.currentUser.uid)
            .listAdvisee,
        initialData: null,
        child: Scaffold(
          appBar: AppBar(
            title: Text('PAdvisor'),
            backgroundColor: Colors.grey,
            actions: [
              PopupMenuButton(
                  onSelected: (item) => onSelected(context, item),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                            value: 0, child: textColor('Archive', 16)),
                        PopupMenuItem(
                            value: 1, child: textColor('Add Advisee', 16)),
                        PopupMenuItem(
                            value: 2, child: textColor('Settings', 16)),
                        PopupMenuItem(
                            value: 3, child: textColor('Sign Out', 16)),
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
                  icon: Icon(Icons.person_outline),
                  label: 'Advisees',
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
        print('Clicked Archived');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => archive()));
        break;
      case 1:
        print('Clicked Add Advisee');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => addAdvisee()));
        break;
      case 2:
        print('Clicked Settings');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => settingPa()));
        break;
      case 3:
        print('Clicked Sign Out');
        Navigator.pop(context);
        break;
    }
  }
}
