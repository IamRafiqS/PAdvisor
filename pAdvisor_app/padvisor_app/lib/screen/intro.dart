import 'package:flutter/material.dart';

class intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo_upm.jpg',
              height: 150,
              width: 200,
            ),
            Text(
              'PAdvisor',
              style: TextStyle(fontSize: 28, color: Colors.red[600]),
            ),
            Image.asset(
              'assets/upmID.png',
              height: 130,
              width: 130,
            ),
            Text(
              '- or -',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.fingerprint_outlined,
                color: Colors.black,
              ),
              label: Text(''),
            ),
            SizedBox(
              height: 35,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Not a Student ?',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
