import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:padvisor/screen/HodPov/adv_list.dart';
import 'package:padvisor/screen/HodPov/arc_list.dart';
import 'package:padvisor/screen/advisee_list.dart';
import 'package:padvisor/screen/archive.dart';
import 'package:provider/provider.dart';

import '../search.dart';

class ListAdvisor extends StatefulWidget {
  @override
  _ListAdvisorState createState() => _ListAdvisorState();
}

class _ListAdvisorState extends State<ListAdvisor> {
//
  bool isLoading = true;
  //
  // method to get list of advisor
  Stream<QuerySnapshot> get listofAdvisor {
    final CollectionReference advisorListCollection = FirebaseFirestore.instance
        .collection('AdvisorAdvisee')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('archive');
    return advisorListCollection.snapshots();
  }

  //
  // method to determine whether the lsit is empty or not
  void determineScreen() {
    if (listofAdvisor == null) {
      setState(() {
        isLoading = true;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void onSelected(BuildContext context, int item, String docId) {
    switch (item) {
      case 0:
        print('Clicked Advisee List');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return AdvList(
              docId: docId,
            );
          }),
        );
        break;
      case 1:
        print('Clicked Archive List');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ArcList(
              docId: docId,
            );
          }),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    determineScreen();
    return isLoading
        ? emptyWidget(context)
        : Scaffold(
            body: bodyWidget(context),
          );
  }

  Widget emptyWidget(BuildContext context) {
    determineScreen();

    return Column(
      children: [
        Center(
          child: Text(
            'Advisee',
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
    );
  }

  Widget bodyWidget(BuildContext context) {
//
    String id = FirebaseAuth.instance.currentUser.uid;
    //print(id);

    final listLength = Provider.of<QuerySnapshot>(context);
    final listOfDocs = listLength.docs.toList();
    final variable = listOfDocs[1].get('name');

    //
    if (listLength == null) {
      setState(() {
        isLoading = true;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'List Advisor',
            style: TextStyle(
                fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 700,
            child: Container(
                child: ListView.builder(
              itemCount: listOfDocs.length,
              itemBuilder: (context, index) {
                //print(listOfDocs[index].reference.id);
                return advisorCard(context, listOfDocs[index].get('name'),
                    listOfDocs[index].reference.id);
              },
            )),
          ),
        ],
      ),
    );
  }

//widget to build each card
  Widget advisorCard(BuildContext context, String name, String docId) {
    return Container(
      width: 370,
      margin: EdgeInsets.all(8),
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              //onTap: ,
              leading: Icon(
                Icons.people_outline_outlined,
                size: 50,
              ),
              title: Text(
                name,
                style: TextStyle(fontSize: 15),
              ),
              trailing: PopupMenuButton(
                  onSelected: (item) => onSelected(context, item, docId),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                            value: 0,
                            child: Text(
                              'Advisee List',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )),
                        PopupMenuItem(
                            value: 1,
                            child: Text(
                              'Archive List',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ))
                      ]),
            ),
          ],
        ),
      ),
    );
  }
}
