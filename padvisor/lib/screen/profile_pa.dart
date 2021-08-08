import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:padvisor/my_flutter_app_icons.dart';
import 'package:padvisor/screen/edit_profile.dart';
import 'package:padvisor/Services/database.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'edit_picture_Pa.dart';

class Profilepa extends StatefulWidget {
  @override
  _ProfilepaState createState() => _ProfilepaState();
}

class _ProfilepaState extends State<Profilepa> {
  // dynamic data;

  CollectionReference ref = FirebaseFirestore.instance.collection('paData');

  String id = FirebaseAuth.instance.currentUser.uid;

  String password;
  String name;
  String staffId;
  String faculty;
  String dept;
  String room;
  String phone;
  String wechat;
  String email;
  //String image = 'https://firebasestorage.googleapis.com/v0/b/padvisor-24103.appspot.com/o/files%2Fdefaultprofile.png?alt=media&token=4fd7cd2e-d8f0-4008-8db4-fd473d643fdd';
  String image;

  String wsLink;
  String weChatLink;
  String emailLink;

  Future setValue() async {
    CollectionReference paRef = FirebaseFirestore.instance.collection('paData');

    final paDoc = await paRef.doc(id).get();

    //image = paDoc.get('image');

    setState(() {
      password = paDoc.get('password');
      name = paDoc.get('name');
      staffId = paDoc.get('StaffId');
      faculty = paDoc.get('faculty');
      dept = paDoc.get('department');
      room = paDoc.get('roomNo');
      phone = paDoc.get('phone num');
      wechat = paDoc.get('wechatid');
      email = paDoc.get('email');
      image = paDoc.get('image');
    });

    //imageRef = image;
  }

  void setLink() {
    wsLink = "https://wa.me/" + phone;
    weChatLink = "https://web.wechat.com/";
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
//
    setValue();
    setLink();
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 580,
          width: 335,
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
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Icon(
                            Icons.call,
                            size: 15,
                          ),
                        ),
                        Text(
                          phone,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 8,
                            ),
                            child: Icon(
                              Icons.email,
                              size: 15,
                            ),
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
                              builder: (context) => editprofile()),
                        );
                      },
                      child: Text('Edit Profile'),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => editPicture()));
                        },
                        child: Text('Edit Picture'))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*
  Future<String> getName(String uid) async {
    String nama = '';
    final CollectionReference paCollection =
        FirebaseFirestore.instance.collection('paData');
    //DocumentSnapshot ds = await paCollection.doc(uid).get();
    await paCollection.doc(uid).get().then((DocumentSnapshot ds) {
      data = ds.data();
      nama = data['name'];
    });

    return nama;
  }*/
}
