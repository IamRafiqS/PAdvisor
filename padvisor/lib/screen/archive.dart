import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:padvisor/screen/search.dart';
import 'package:padvisor/screen/setting_pa.dart';
import 'package:provider/provider.dart';

class archive extends StatefulWidget {
  @override
  _archiveState createState() => _archiveState();
}

class _archiveState extends State<archive> {
//
  bool isLoading = true;

  @override
  // method to return advisee list stream
  Stream<QuerySnapshot> get listofArchive {
    final CollectionReference adviseeListCollection = FirebaseFirestore.instance
        .collection('AdvisorAdvisee')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('archive');
    return adviseeListCollection.snapshots();
  }

  void determineScreen() {
    if (listofArchive == null) {
      setState(() {
        isLoading = true;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget build(BuildContext context) {
    //
    //
    return isLoading
        ? emptyWidget(context)
        : StreamBuilder(
            stream: listofArchive,
            initialData: null,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return wholeBody(context, snapshot);
            });
  }

  Widget emptyWidget(BuildContext context) {
    determineScreen();

    return Scaffold(
        appBar: AppBar(
          title: Text('PAdvisor'),
          backgroundColor: Colors.grey,
        ),
        body: Column(
          children: [
            Center(
              child: Text(
                'Archive',
                style: TextStyle(fontSize: 35),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(30),
              alignment: Alignment.center,
              child: Center(
                child: Text(
                  'List is Empty',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              alignment: Alignment.center,
              child: Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  child: Text('Refresh'),
                  onPressed: determineScreen,
                ),
              ),
            )
          ],
        ));
  }
}

Widget textColor(String text, double size) {
  return Text(
    text,
    style: TextStyle(
        color: Colors.red, fontSize: size, fontWeight: FontWeight.bold),
  );
}

void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      print('Clicked Settings');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => settingPa()));
      break;
    case 1:
      print('Clicked Sign Out');
      Navigator.pop(context);
      break;
  }
}

//
// Widget to build card for each archived student
Widget archiveCard(String name, String cohort) {
  return Container(
    width: 370,
    margin: EdgeInsets.all(8),
    child: Card(
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(
              Icons.people_outline_outlined,
              size: 50,
            ),
            title: Text(
              name,
              style: TextStyle(fontSize: 15),
            ),
            subtitle: Text(cohort),
          ),
        ],
      ),
    ),
  );
}

//
Widget bodyWidget(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//
  String id = FirebaseAuth.instance.currentUser.uid;
  print(id);
  final CollectionReference archiveCollection = FirebaseFirestore.instance
      .collection('AdvisorAdvisee')
      .doc(id)
      .collection('archive');

  // to get data
  final listLength = snapshot.data;
  //final listLength = Provider.of<QuerySnapshot>(context);
  final listOfDocs = listLength.docs.toList();
  final variable = listOfDocs[0].get('name');
  //
  print(variable);

  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          'Archive',
          style: TextStyle(
              fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 25,
        ),
        SizedBox(
          height: 700,
          child: ListView.builder(
              itemCount: listOfDocs.length,
              itemBuilder: (context, index) {
                return archiveCard(listOfDocs[index].get('name'),
                    listOfDocs[index].get('Cohort'));
              }),
        )
      ],
    ),
  );
}

//
//Widget for whole body inc Scaffold
Widget wholeBody(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  return Scaffold(
      appBar: AppBar(
        title: Text('PAdvisor'),
        backgroundColor: Colors.grey,
        actions: [
          PopupMenuButton(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                    PopupMenuItem(value: 0, child: textColor('Settings', 16)),
                    PopupMenuItem(value: 1, child: textColor('Sign Out', 16)),
                  ])
        ],
      ),
      body: bodyWidget(context, snapshot),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => search()),
          );
        },
        child: const Icon(
          Icons.search,
          color: Colors.black,
        ),
      ));
}
