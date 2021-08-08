import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'hod_or_pa.dart';

class editProfile extends StatefulWidget {
  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
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
      backgroundColor: HexColor('#FFFFFF'),
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
                        'Sign Out',
                        style: TextStyle(
                          color: Color(0xfff56476),
                        ),
                      ),
                    ),
                  ]),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Edit Profile',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.red[400],
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 20),
              child: Text(
                'Telephone No:. ',
                style: TextStyle(
                    color: Colors.red[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Telephone No.',
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 20, top: 20),
              child: Text(
                'Email:.',
                style: TextStyle(
                    color: Colors.red[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email.',
              )),
            ),
            SizedBox(
              height: 150,
            ),
            Center(
              child: Container(
                width: 200.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xfff56476)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  onPressed: () {},
                  child: Text('Save', style: TextStyle(fontSize: 20)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
