import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:album_app/screens/camera.dart';
import 'dart:io';
import 'package:album_app/screens/folder.dart';

class dashboard extends StatefulWidget {
  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  String imageFolder = 'images';

  @override
  void initState() {
    super.initState();
    imageFolder = 'images';
  }

  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // CollectionReference ref = FirebaseFirestore.instance.collection('kitchen');

  void _getFile(BuildContext context) async {
    final image = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => dashboard()));
  }

  void _getFolder(BuildContext context) async {
    var newFolder = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => folder()));

    setState(() {
      imageFolder = newFolder;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Dashboard'),
        elevation: 10,
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: Theme.of(context).iconTheme,
        actions: [
          IconButton(
              icon: Icon(Icons.settings), onPressed: () => _getFolder(context))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: StreamBuilder<QuerySnapshot>(
                  stream:
                      _firebaseFirestore.collection(imageFolder).snapshots(),
                  builder: (context, snapshot) {
                    return snapshot.hasError
                        ? Center(
                            child: Text(
                                "There is some problem loading your images"),
                          )
                        : snapshot.hasData
                            ? GridView.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 50,
                                crossAxisSpacing: 30,
                                childAspectRatio: 1,
                                children: snapshot.data.docs
                                    .map((e) => ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: ListView(
                                          children: [
                                            Image.network(
                                              e.get("url"),
                                              fit: BoxFit.cover,
                                            ),
                                            Text(
                                              e.get('desc').toString(),
                                              style: TextStyle(fontSize: 25),
                                            ),
                                            Text(
                                              e.get('date').toString(),
                                              style: TextStyle(fontSize: 25),
                                            ),
                                            Text(
                                              e.get('Location').toString(),
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        )))
                                    .toList(),
                              )
                            : Container();
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => camera())),
                  child: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
