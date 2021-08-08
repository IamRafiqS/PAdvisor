import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:padvisor/screen/hod_screen/homepage_hod.dart';

import '../login_hod.dart';

class SettingsHOD extends StatefulWidget {
  @override
  _SettingsHODState createState() => _SettingsHODState();
}

class _SettingsHODState extends State<SettingsHOD> {
  final CollectionReference cohortCollection =
      FirebaseFirestore.instance.collection('CohortFilterNotice');
  final CollectionReference cohortListCollection = FirebaseFirestore.instance
      .collection('CohortFilterNotice')
      .doc('Cohort List')
      .collection('List of Cohort');

  List<String> newCohortList = [];
  List<String> cohortList2 = ['2018-2019', '2019-2020', '2020-2021'];
  String selectedDropdown, holder = '', newCohort;
  String cohortHold, excludedCohort;

//   void getCurrentExcludeCohortData() async {
// }
  Future simpleFunction() async {
    final selectedCohortDoc =
        await cohortCollection.doc('Selected Cohort').get();
    if (this.mounted) {
      setState(() {
        excludedCohort = selectedCohortDoc.get('cohortFiltered');
      });
    }
  }

  final _controllerNewCohort = TextEditingController();

  @override
  Widget build(BuildContext context) {
    simpleFunction();
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 12, bottom: 12),
                alignment: Alignment.center,
                child: Text(
                  'Settings',
                  style: GoogleFonts.robotoSlab(
                    textStyle:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ), //new!
                ),
              ),
              Column(
                children: [
                  Text(
                    'Notice Settings',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Divider(
                height: 10,
                thickness: 2,
                //color: Colors.amberAccent,
              ),
              Row(
                children: [
                  Container(
                    width: 200,
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Exclude cohort in Students Only option starting from year:',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: cohortListCollection.snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Text('Loading');
                      } else {
                        List<DropdownMenuItem> cohortItems = [];
                        for (int i = 0; i < snapshot.data.docs.length; i++) {
                          DocumentSnapshot snap = snapshot.data.docs[i];
                          cohortItems.add(
                            DropdownMenuItem(
                              child: Text(snap.id),
                              value: "${snap.id}",
                            ),
                          );
                        }
                        return Container(
                          child: DropdownButton(
                            value: selectedDropdown,
                            onChanged: (data) {
                              if (this.mounted) {
                                setState(() {
                                  selectedDropdown = data;
                                });
                              }
                            },
                            hint: Text('Select cohort'),
                            items: cohortItems,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Excluded cohort starting from: $excludedCohort',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                width: 400,
                child: Text(
                  'Note: The students from the selected year and below will not be notified anymore',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Add new cohort:',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _controllerNewCohort,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Write in this format: YYYY - YYYY",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  height: 40,
                  width: 200,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        minimumSize: Size(150, 32),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                    onPressed: () async {
                      getDropDownItem();
                      cohortHold = holder;
                      if (cohortHold == null) {
                        cohortHold = "None";
                      } else {
                        filterCohort(cohortHold);
                      }

                      newCohort = _controllerNewCohort.text;
                      if (newCohort != null) {
                        updateCohort(newCohort);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePageHOD()),
                      );
                    },
                    child: Text(
                      'Apply Changes',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        print('Clicked Settings');
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => CoursesStudent()));
        break;
      case 1:
        print('Clicked Sign Out');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginHOD()));
        break;
    }
  }

  Widget textColor(String text, double size) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.red, fontSize: size, fontWeight: FontWeight.bold),
    );
  }

  void getDropDownItem() {
    if (this.mounted) {
      setState(() {
        holder = selectedDropdown;
      });
    }
  }

  Future filterCohort(String cohortFiltered) async {
    return await cohortCollection
        .doc('Selected Cohort')
        .set({'cohortFiltered': cohortFiltered});
  }

  Future addCohort(String cohort, int index) async {
    //add cohort into firebase
    return await cohortListCollection
        .doc(cohort)
        .set({'cohort': cohort, 'index': index});

    //update index
  }

  Future addCurrentIndex(int index) async {
    return await cohortCollection.doc('Current Index').set({'index': index});
  }

  Future<void> updateCohort(String newCohort) {
    int index;
    final docRef = cohortCollection.doc('Current Index');
    docRef.get().then((value) {
      index = value.get('index');
    });

    //update current index
    cohortListCollection.get().then((querysnapshot) {
      if (querysnapshot.docs.isEmpty) {
        print('Doc is empty');
        addCurrentIndex(1);
        addCohort(newCohort, 1);
      } else {
        print('Doc is not empty');
        addCurrentIndex(index + 1);
        addCohort(newCohort, index + 1);
      }
    });
  }
}
