import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:padvisor_app/main.dart';
import 'package:padvisor_app/screen/hod_or_pa.dart';
import 'login_pa.dart';
import 'profile_staff.dart';
import 'search.dart';

class advisorList extends StatefulWidget {
  @override
  _advisorListState createState() => _advisorListState();
}

class _advisorListState extends State<advisorList> {
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        print('Clicked Profile');
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
              'Advisor List',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 370,
                    height: 100,
                    //margin: EdgeInsets.all(8),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 370,
                    height: 100,
                    //margin: EdgeInsets.all(8),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 370,
                    height: 100,
                    // margin: EdgeInsets.all(8),
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
