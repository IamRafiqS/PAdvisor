import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:padvisor/screen/student_screen/edit_picture_student.dart';
import 'package:padvisor/screen/student_screen/student_edit_profile.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../my_flutter_app_icons.dart';

class ProfileStudent extends StatefulWidget {
  @override
  _ProfileStudentState createState() => _ProfileStudentState();
}

class _ProfileStudentState extends State<ProfileStudent> {
  CollectionReference ref =
      FirebaseFirestore.instance.collection('StudentData');

  String id = FirebaseAuth.instance.currentUser.uid;

  String name;
  String matric;
  String ic;
  String sem;
  String cohort;
  String phone;
  String email;
  String wechat;
  String image;

  String wsLink;
  String weChatLink;
  String emailLink;

  Future setValue() async {
    CollectionReference studentRef =
        FirebaseFirestore.instance.collection('StudentData');

    final studentDoc = await studentRef.doc(id).get();
    setState(() {
      name = studentDoc.get('name');
      matric = studentDoc.get('MatricNo');
      ic = studentDoc.get('IC');
      sem = studentDoc.get('Semester');
      cohort = studentDoc.get('Cohort');
      phone = studentDoc.get('phone num');
      email = studentDoc.get('email');
      wechat = studentDoc.get('wechatid');
      image = studentDoc.get('image');
    });
  }

  void setLink() {
    wsLink = "https://wa.me/" + phone;
    weChatLink = "https://web.wechat.com/" + wechat;
    emailLink = "https://www.google.com/gmail/";
  }

  _launchURL(String url) async {
    //const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true, forceSafariVC: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    setValue();
    setLink();
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 580,
          width: 310,
          child: SingleChildScrollView(
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
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
                            image: NetworkImage(image ??
                                "https://upload.wikimedia.org/wikipedia/en/b/bd/Doraemon_character.png"),
                            fit: BoxFit.cover,
                          ),
                          // image:
                          // DecorationImage(
                          //   image: AssetImage('assets/defaultprofile.png'),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name ?? "",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              matric ?? "",
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
                            Text(ic ?? "", style: TextStyle(fontSize: 15)),
                            Text(sem ?? "", style: TextStyle(fontSize: 15)),
                            Text(cohort ?? "", style: TextStyle(fontSize: 15)),
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
                            Text(phone ?? "", style: TextStyle(fontSize: 15)),
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide.none),
                                onPressed: () {
                                  _launchURL(wsLink);
                                },
                                child: Image.asset(
                                  'assets/whatsapp.png',
                                  height: 24.0,
                                  width: 24.0,
                                )),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide.none),
                              onPressed: () {
                                _launchURL(weChatLink);
                              },
                              child: Image.asset(
                                'assets/wechat.png',
                                height: 24.0,
                                width: 24,
                              ),
                            ),
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide.none),
                                onPressed: () {
                                  _launchURL(emailLink);
                                },
                                child: Image.asset(
                                  'assets/direct.png',
                                  height: 24,
                                  width: 24,
                                ))
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
                            Text(email ?? "", style: TextStyle(fontSize: 15)),
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
                            MaterialPageRoute(
                                builder: (context) => editPictureStudent()),
                          );
                        },
                        child: Text(
                          'Change Profile Picture',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentEditProfile()),
                          );
                        },
                        child: Text(
                          'Edit Profile',
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
      ),
    );
  }
}
