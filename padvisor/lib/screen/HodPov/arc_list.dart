import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:padvisor/Services/loading.dart';

class ArcList extends StatefulWidget {
  @override
  _ArcListState createState() => _ArcListState();
  String docId = '';
  ArcList({this.docId});
}

class _ArcListState extends State<ArcList> {
  //
  bool isLoading = true;

  //
  // method to return archive list stream
  Stream<QuerySnapshot> get listofArchive {
    final CollectionReference adviseeListCollection = FirebaseFirestore.instance
        .collection('AdvisorAdvisee')
        .doc(widget.docId)
        .collection('archive');
    return adviseeListCollection.snapshots();
  }

  // method to determine which screen needed to be shown
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

  //

  // build method
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? emptyWidget(context)
        : StreamBuilder(
            stream: listofArchive,
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

//
// Widget that show list of archive student based on specific pa
  Widget bodyWidget(
      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //
    // the variable below will fetch docs from collection
    final listLength = snapshot.data;
    final listOfDocs = listLength.docs.toList();

    //
    print('LIST LENGTH: ' + listOfDocs.length.toString());

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
                'Archive',
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
                    return archiveCard(listOfDocs[index].get('name'),
                        listOfDocs[index].get('Cohort'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
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

// Widget shown when no archive student available
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
              'Archive List',
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
