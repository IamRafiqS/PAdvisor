import 'package:flutter/material.dart';
import 'package:exam_app/main.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 55, 113, 142),
          elevation: 10,
          centerTitle: true,
          title: Text(
            'Roselle',
            style: TextStyle(
              fontSize: 30,
            ),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Welcome',
              style: TextStyle(fontSize: 40),
            ),
            Image(
              image: AssetImage('assets/images/upm.jpg'),
              height: 270,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Mohamad Rafiq Syaheri bin Sazali',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '202373',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.fromLTRB(130, 20, 130, 20),
                primary: Colors.black,
                backgroundColor: Color.fromARGB(255, 224, 119, 125),
                textStyle: TextStyle(fontSize: 30),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
