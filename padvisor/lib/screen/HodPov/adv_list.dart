import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:padvisor/Services/loading.dart';
import 'package:padvisor/model/list_advisee.dart';
import 'package:padvisor/screen/add_archive.dart';
import 'package:padvisor/screen/archive.dart';
import 'package:padvisor/screen/delete_advisee.dart';
import 'package:padvisor/screen/form.dart';
import 'package:provider/provider.dart';

import '../search_new.dart';

class AdvList extends StatefulWidget {
  @override
  _AdvListState createState() => _AdvListState();
  String docId = '';
  AdvList({this.docId});
}

class _AdvListState extends State<AdvList> {
  bool isLoading = true;

  //
  // method to return advisee list stream
  Stream<QuerySnapshot> get listofAdvisee {
    final CollectionReference adviseeListCollection = FirebaseFirestore.instance
        .collection('AdvisorAdvisee')
        .doc(widget.docId)
        .collection('student');
    return adviseeListCollection.snapshots();
  }

  void determineScreen() {
    if (listofAdvisee == null) {
      setState(() {
        isLoading = true;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  //
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        print('Clicked Fill Form');
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => fillForm()),
        // );
        break;
      case 1:
        print('clicked Archive');
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => AddArchive()));

        break;
      case 2:
        print('Clicked Delete');
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => DeleteAdvisee()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    String id = FirebaseAuth.instance.currentUser.uid;
    //
    return isLoading
        ? emptyWidget(context)
        : StreamBuilder(
            stream: listofAdvisee,
            initialData: null,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Loading();
              }
              return bodyWidget(context, snapshot);
            },
          );
  }

  Widget adviseeCard(
      BuildContext context, String name, String matric, String cohort) {
    //
    //
    //
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Container(
            width: 380,
            height: 90,
            alignment: Alignment.center,
            margin: EdgeInsets.all(8),
            child: Card(
              elevation: 5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () {},
                    // trailing: PopupMenuButton(
                    //     onSelected: (item) => onSelected(context, item),
                    //     itemBuilder: (context) => [
                    //           PopupMenuItem(value: 0, child: Text('Fill Form')),
                    //           PopupMenuItem(value: 1, child: Text('Archive')),
                    //           PopupMenuItem(value: 2, child: Text('Delete'))
                    //         ]),
                    leading: Icon(
                      Icons.people_outline_outlined,
                      size: 50,
                    ),
                    title: Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            cohort,
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    subtitle: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        matric,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]));
  }

  Widget bodyWidget(
      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //
    //String id = FirebaseAuth.instance.currentUser.uid;
    //print(id);

    // to get number of docs
    // the variable below will fetch docs from collection
    final listLength = snapshot.data;
    final listOfDocs = listLength.docs.toList();
    String variable = listOfDocs[0].get('matricNo');

    // if (variable.isEmpty) {
    //   setState(() {
    //     isLoading = true;
    //   });
    // } else {
    //   setState(() {
    //     isLoading = false;
    //   });
    // }

    //final advisee = _listofAdviseeFromSnapshot(listLength);
    //
    print('LIST LENGTH: ' + listOfDocs.length.toString());
    print('Variable: ' + variable);
    //print('Name: ' + advisee.first.name);

    return Scaffold(
      appBar: AppBar(
        title: Text('PAdvisor'),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Advisee',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 700,
                child: ListView.builder(
                  itemCount: listOfDocs.length,
                  itemBuilder: (context, index) {
                    return adviseeCard(
                        context,
                        listOfDocs[index].get('name'),
                        listOfDocs[index].get('matricNo'),
                        listOfDocs[index].get('cohort'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget emptyWidget(BuildContext context) {
    determineScreen();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            child: Text(
              'Advisee List',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
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
                  color: Colors.black,
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
      ),
    );
  }
}
