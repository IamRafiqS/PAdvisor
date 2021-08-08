import 'package:flutter/material.dart';
import 'package:padvisor/screen/view_course.dart';

class course extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'PAdvisor',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Text(
                'Courses',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
          Expanded(
            child: SizedBox(
              height: 200,
              child: ListView(
                padding: EdgeInsets.all(10.0),
                children: [
                  cardCourse('SSE3151', 'DKNY', context),
                  cardCourse('SSK3100', 'DDNK', context)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget courseCard(String title, String name) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            name,
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }

  Widget cardCourse(String title, String name, BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => viewCourse()));
            },
            title: Text(title),
            subtitle: Text(name),
          )
        ],
      ),
    );
  }
}
