import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:padvisor_app/screen/hod_or_pa.dart';
import 'package:padvisor_app/screen/search.dart';
import 'package:padvisor_app/screen/viewProfileStaff.dart';
import 'profile_staff.dart';
import 'login_pa.dart';
import 'package:padvisor_app/screen/viewProfileStudent.dart';

class adviseeList extends StatefulWidget {
  @override
  _adviseeListState createState() => _adviseeListState();
}

class _adviseeListState extends State<adviseeList> {
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        //print('Clicked Profile');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileStaff()),
        );
        break;
      case 1:
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
                          'Sign Out',
                          style: TextStyle(
                            color: Color(0xfff56476),
                          ),
                        ),
                      ),
                    ]),
          ],
        ),
        backgroundColor: HexColor('#B97397'),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Advisee',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment(-0.9, -1),
              child: Text('2019/2020',
                  style: TextStyle(fontSize: 25, color: Colors.white54)),
            ),
            Divider(
              height: 10,
              color: Colors.white70,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 370,
                    height: 90,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(8),
                    child: Card(
                      elevation: 5,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewProfileStudent()),
                              );
                            },
                            leading: Icon(
                              Icons.people_outline_outlined,
                              size: 50,
                            ),
                            title: Container(
                              //color: Colors.green,
                              // padding:
                              //     const EdgeInsets.only(left: 8.0, top: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Name1',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            subtitle: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Matric No.',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 370,
                    height: 90,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(8),
                    child: Card(
                      elevation: 5,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewProfileStudent()),
                              );
                            },
                            leading: Icon(
                              Icons.people_outline_outlined,
                              size: 50,
                            ),
                            title: Container(
                              //color: Colors.green,
                              // padding:
                              //     const EdgeInsets.only(left: 8.0, top: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Name n-1',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            subtitle: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Matric No.',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 370,
                    height: 90,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(8),
                    child: Card(
                      elevation: 5,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewProfileStudent()),
                              );
                            },
                            leading: Icon(
                              Icons.people_outline_outlined,
                              size: 50,
                            ),
                            title: Container(
                              //color: Colors.green,
                              // padding:
                              //     const EdgeInsets.only(left: 8.0, top: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Name n',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            subtitle: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Matric No.',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => search()),
            );
          },
          child: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ));
  }
}
