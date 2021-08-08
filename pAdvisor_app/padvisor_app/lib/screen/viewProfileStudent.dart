import 'package:flutter/material.dart';
import 'package:padvisor_app/screen/hod_or_pa.dart';
import 'package:padvisor_app/screen/studentCourses.dart';
import 'package:padvisor_app/screen/testMark.dart';
import 'profile_staff.dart';
import 'login_pa.dart';

class ViewProfileStudent extends StatelessWidget {
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
      backgroundColor: Color(0xffb97397),
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
      body: Center(
        child: SizedBox(
          height: 530,
          width: 300,
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      height: 330,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/student_picture.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Matric No.',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('IC/Passport No:',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Text('Semester Session:',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Text('Cohort:',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('123456789012', style: TextStyle(fontSize: 15)),
                          Text('2020/2021-2', style: TextStyle(fontSize: 15)),
                          Text('2019/2020', style: TextStyle(fontSize: 15)),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.call,
                            size: 15,
                          ),
                          Icon(
                            Icons.email,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('012-345 6789', style: TextStyle(fontSize: 15)),
                          Text('matrics@student.upm.edu.my',
                              style: TextStyle(fontSize: 15)),
                        ],
                      ),
                    ),
                  ],
                ),
                ButtonBar(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StdCourses()),
                        );
                      },
                      child: Text('Courses'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StdTestMark()),
                        );
                      },
                      child: Text('Test Marks'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
