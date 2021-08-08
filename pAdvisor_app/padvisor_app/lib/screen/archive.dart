import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'profile_staff.dart';
import 'hod_or_pa.dart';
import 'search.dart';

class archive extends StatefulWidget {
  @override
  _archiveState createState() => _archiveState();
}

class _archiveState extends State<archive> {
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
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
              'Archive',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 370,
                    margin: EdgeInsets.all(8),
                    child: Card(
                      elevation: 5,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.people_outline_outlined,
                              size: 50,
                            ),
                            title: Text(
                              'Name',
                              style: TextStyle(fontSize: 15),
                            ),
                            subtitle: Text('Cohort'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 370,
                    margin: EdgeInsets.all(8),
                    child: Card(
                      elevation: 5,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.people_outline_outlined,
                              size: 50,
                            ),
                            title: Text(
                              'Name',
                              style: TextStyle(fontSize: 15),
                            ),
                            subtitle: Text('Cohort'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 370,
                    margin: EdgeInsets.all(8),
                    child: Card(
                      elevation: 5,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.people_outline_outlined,
                              size: 50,
                            ),
                            title: Text(
                              'Name',
                              style: TextStyle(fontSize: 15),
                            ),
                            subtitle: Text('Cohort'),
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
