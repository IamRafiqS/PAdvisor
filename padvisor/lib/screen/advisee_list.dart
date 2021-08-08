import 'package:flutter/material.dart';
import 'package:padvisor/Services/database.dart';
import 'package:padvisor/model/list_advisee.dart';
import 'package:padvisor/screen/add_archive.dart';
import 'package:padvisor/screen/delete_advisee.dart';
import 'package:padvisor/screen/form.dart';
import 'package:padvisor/screen/profile_student.dart';
import 'package:padvisor/screen/search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:padvisor/screen/search_new.dart';
import 'package:provider/provider.dart';

class adviseeList extends StatefulWidget {
  //
  //reference to advisor Advisee collection
  CollectionReference adviseeCollection;
  @override
  _adviseeListState createState() => _adviseeListState();
}

class _adviseeListState extends State<adviseeList> {
  bool isLoading = true;

  //
  // method to return advisee list stream
  Stream<QuerySnapshot> get listofAdvisee {
    final CollectionReference adviseeListCollection = FirebaseFirestore.instance
        .collection('AdvisorAdvisee')
        .doc(FirebaseAuth.instance.currentUser.uid)
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => fillForm()),
        );
        break;
      case 1:
        print('clicked Archive');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddArchive()));

        break;
      case 2:
        print('Clicked Delete');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DeleteAdvisee()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    String id = FirebaseAuth.instance.currentUser.uid;
    //
    return isLoading
        ? emptyWidget(context)
        : StreamProvider<QuerySnapshot>.value(
            value: listofAdvisee,
            initialData: null,
            child: Scaffold(
                body: bodyWidget(context),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => searchNew()),
                    );
                  },
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                )),
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
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => ViewProfileStudent()),
                      // );
                    },
                    trailing: PopupMenuButton(
                        onSelected: (item) => onSelected(context, item),
                        itemBuilder: (context) => [
                              PopupMenuItem(value: 0, child: Text('Fill Form')),
                              PopupMenuItem(value: 1, child: Text('Archive')),
                              PopupMenuItem(value: 2, child: Text('Delete'))
                            ]),
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

  Widget bodyWidget(BuildContext context) {
    //
    String id = FirebaseAuth.instance.currentUser.uid;
    print(id);
    final CollectionReference adviseeCollection = FirebaseFirestore.instance
        .collection('AdvisorAdvisee')
        .doc(id)
        .collection('student');

    // method below are not needed but if removed error may occur
    List<ListAdvisee> _listofAdviseeFromSnapshot(QuerySnapshot snapshot) {
      return snapshot.docs.map((doc) {
        return ListAdvisee(name: doc['name'], matricNo: doc['matricNo']);
      });
    }

    // to get number of docs
    // the variable below will fetch docs from collection
    final listLength = Provider.of<QuerySnapshot>(context);
    final listOfDocs = listLength.docs.toList();
    String variable = listOfDocs[0].get('matricNo');

    if (variable.isEmpty) {
      setState(() {
        isLoading = true;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }

    //final advisee = _listofAdviseeFromSnapshot(listLength);
    //
    print('LIST LENGTH: ' + listOfDocs.length.toString());
    print('Variable: ' + variable);
    //print('Name: ' + advisee.first.name);

    return SingleChildScrollView(
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
}
