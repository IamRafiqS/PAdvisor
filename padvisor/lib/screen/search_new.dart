import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:padvisor/Services/search.dart';
import 'package:padvisor/screen/search_result.dart';

class searchNew extends StatefulWidget {
  @override
  _searchNewState createState() => _searchNewState();
}

class _searchNewState extends State<searchNew> {
  //
  List _allResults = [];
  Future resourceLoaded;
  //
  // method to return student list stream
  Stream<QuerySnapshot> get listofStudent {
    final CollectionReference adviseeListCollection =
        FirebaseFirestore.instance.collection('StudentData');
    return adviseeListCollection.snapshots();
  }

  //this is new
  // method to return student list stream
  getNewListofStudent() async {
    final CollectionReference studentListCollection =
        FirebaseFirestore.instance.collection('StudentData');

    setState(() {
      studentListCollection.doc().get().then((value) => _allResults.add(value));
    });
    return 'complete';
  }

  //
  String name;
  String matric;
  bool isVisible = true;
  List listDocs = [];
  //
  //
  final _searchController = TextEditingController();
  //
  @override
  void initState() {
    super.initState();
    name = '';
    matric = ' ';
  }

  //
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PAdvisor'),
          backgroundColor: Colors.grey,
        ),
        body: isVisible ? otherBodyWidget() : bodyWidget());
  }

  //
  // Widget to display all students in card
  Widget studentCard(String nama, String noMatric) {
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
                    leading: Icon(
                      Icons.people_outline_outlined,
                      size: 50,
                    ),
                    title: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        nama,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    subtitle: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        noMatric,
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

//
// method to start search
  Future initiateSearch(String value) async {
    // SearchServices().searchByName(value).then((value) => (QuerySnapshot doc) {
    //       return doc.docs[0].data();
    //     });

    QuerySnapshot qs = await SearchServices().searchByName(value);
    setState(() {
      listDocs.add(qs.docs.first.data());
      isVisible = false;
    });

    return qs;
    //}
  }

//display results
  Widget bodyWidget() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Text('Search Results'),
          ),
          SizedBox(
            height: 700,
            child: ListView.builder(
                //
                itemCount: listDocs.length,
                itemBuilder: (context, index) {
                  //print(tempSearchStore[index].get('MatricNo'));
                  return studentCard(listDocs[index].get('name'),
                      listDocs[index].get('MatricNo'));
                }),
          )
        ],
      ),
    );
  }

//display search field
  Widget otherBodyWidget() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Text(
              'Search',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 100,
            width: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 280,
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: 'Search',
                        hintText: 'Search matric no..'),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    child: Text('Search'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () async {
                      await initiateSearch(_searchController.text)
                          .then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchResults(
                                      qs: value,
                                    )));
                        // setState(() {
                        //   isVisible = true;
                        //   name = value.get('name');
                        //   matric = value.get('MatricNo');
                        // });
                        // return studentCard(
                        //     value.get('name'), value.get('MatricNo'));
                      });
                      //return studentCard(ds.get('name'), ds.get('MatricNo'));
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          // SizedBox(
          //   height: 700,
          //   child: ListView.builder(
          //       //
          //       itemCount: listDocs.length,
          //       itemBuilder: (context, index) {
          //         //print(tempSearchStore[index].get('MatricNo'));
          //         return studentCard(listDocs[index].get('name'),
          //             listDocs[index].get('MatricNo'));
          //       }),
          // )
        ],
      ),
    );
  }
}
