import 'package:flutter/material.dart';
import 'package:padvisor/my_flutter_app_icons.dart';
import 'package:padvisor/screen/course.dart';
import 'package:padvisor/screen/form.dart';

class ViewProfileStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAdvisor'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: SizedBox(
          height: 580,
          width: 315,
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
                          image: AssetImage('assets/defaultprofile.png'),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.call,
                            size: 15,
                          ),
                          // SizedBox(
                          //   width: 15,
                          // ),
                          Text('012-3456789', style: TextStyle(fontSize: 15)),
                          OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide.none),
                              onPressed: () {},
                              child: Image.asset(
                                'assets/whatsapp.png',
                                height: 24.0,
                                width: 24.0,
                              )),
                          OutlinedButton(
                            style:
                                OutlinedButton.styleFrom(side: BorderSide.none),
                            onPressed: () {},
                            child: Image.asset(
                              'assets/wechat.png',
                              height: 24.0,
                              width: 24,
                            ),
                          ),
                          OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide.none),
                              onPressed: () {},
                              child: Image.asset(
                                'assets/direct.png',
                                height: 24,
                                width: 24,
                              ))

                          // IconButton(
                          //     iconSize: 20,
                          //     icon: Icon(
                          //       MyFlutterApp.wechat,
                          //     ),
                          //     onPressed: () {})
                        ],
                      ),
                    ),
                    const Divider(
                      height: 20,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.email,
                            size: 15,
                          ),
                          SizedBox(
                            width: 15,
                          ),
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
                          MaterialPageRoute(builder: (context) => fillForm()),
                        );
                      },
                      child: Text(
                        'Fill Form',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => course()),
                        );
                      },
                      child: Text(
                        'Courses',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
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
