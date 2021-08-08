import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:padvisor/screen/hod_screen/edit_picture_hod.dart';
import 'package:padvisor/screen/hod_screen/hod_edit_profile.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../my_flutter_app_icons.dart';
import '../edit_profile.dart';

class ProfileHOD extends StatefulWidget {
  @override
  _ProfileHODState createState() => _ProfileHODState();
}

class _ProfileHODState extends State<ProfileHOD> {
  CollectionReference ref = FirebaseFirestore.instance.collection('hodData');

  String id = FirebaseAuth.instance.currentUser.uid;

  String name;
  String staffId;
  String password;
  String phone;
  String faculty;
  String dept;
  String room;
  String email;
  String wechat;
  String image;

  String wsLink;
  String weChatLink;
  String emailLink;

  Future setValue() async {
    CollectionReference hodRef =
        FirebaseFirestore.instance.collection('hodData');

    final hodDoc = await hodRef.doc(id).get();
    setState(() {
      name = hodDoc.get('name');
      staffId = hodDoc.get('StaffId');
      password = hodDoc.get('password');
      phone = hodDoc.get('phone num');
      faculty = hodDoc.get('faculty');
      dept = hodDoc.get('department');
      room = hodDoc.get('roomNo');
      email = hodDoc.get('email');
      wechat = hodDoc.get('wechatid');
      image = hodDoc.get('image');
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
    //print("I'm here" + name + staffId + password + phone + faculty + dept + room + email + wechat);
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 580,
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
                          image: NetworkImage(image ??
                              "https://upload.wikimedia.org/wikipedia/en/b/bd/Doraemon_character.png"),
                          fit: BoxFit.cover,
                        ),
                        // image: DecorationImage(
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
                          Text('Faculty:',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Text('Department:',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Text('Room No:',
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
                          Text(faculty ?? "", style: TextStyle(fontSize: 15)),
                          Text(dept ?? "", style: TextStyle(fontSize: 15)),
                          Text(room ?? "", style: TextStyle(fontSize: 15)),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.call,
                          size: 15,
                        ),
                        Text(
                          phone ?? "",
                          style: TextStyle(fontSize: 15),
                        ),
                        OutlinedButton(
                            style:
                                OutlinedButton.styleFrom(side: BorderSide.none),
                            onPressed: () {
                              _launchURL(wsLink);
                            },
                            child: Image.asset(
                              'assets/whatsapp.png',
                              height: 24.0,
                              width: 24.0,
                            )),
                        OutlinedButton(
                          style:
                              OutlinedButton.styleFrom(side: BorderSide.none),
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
                            style:
                                OutlinedButton.styleFrom(side: BorderSide.none),
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
                    const Divider(
                      height: 20,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.email,
                            size: 15,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            email ?? "",
                            style: TextStyle(fontSize: 15),
                          ),
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
                              builder: (context) => EditProfileHOD()),
                        );
                      },
                      child: Text('Edit Profile'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => editPictureHod()),
                        );
                      },
                      child: Text('Edit Picture'),
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
