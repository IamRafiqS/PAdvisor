import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:padvisor/screen/student_screen/add_course.dart';
import 'package:padvisor/screen/student_screen/edit_course.dart';
import 'package:padvisor/screen/view_course.dart';
import 'package:provider/provider.dart';

class CoursesStudent extends StatefulWidget {
  @override
  _CoursesStudentState createState() => _CoursesStudentState();
}

class _CoursesStudentState extends State<CoursesStudent> {
  String id = FirebaseAuth.instance.currentUser.uid;

  String courseCode;
  String lecturerName;

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        print('Clicked Edit Course');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditCourse()),
        );
        break;
      case 1:
        print('Clicked Delete');
        break;
    }
  }

  Stream<QuerySnapshot> get listofCourses {
    final CollectionReference courseListCollection = FirebaseFirestore.instance
        .collection('StudentData')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('courses');
    return courseListCollection.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: listofCourses,
        initialData: null,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey,
              title: Text(
                'PAdvisor',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            body: courseWidget(snapshot),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCourse()),
                );
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.red,
            ),
          );
        });
  }

  Widget courseWidget(AsyncSnapshot<QuerySnapshot> as) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              'Courses',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: cardCourse(context, as),
        ),
      ],
    );
  }

  List getList() {
    List cl = [];
    final ref = FirebaseFirestore.instance
        .collection('StudentData')
        .doc(id)
        .collection('courses')
        .snapshots()
        .forEach((element) {
      print(element);
      cl.add(element);
    });
    //final List lists = await ref.toList();
    return cl;
  }

  Future<void> _deleteCourse(String path) async {
    await FirebaseFirestore.instance
        .collection('StudentData')
        .doc(id)
        .collection('courses')
        .doc(path)
        .delete();
  }

  Future<void> _showDeleteForm(String path) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
              actions: <Widget>[
                FlatButton(
                  color: Colors.red,
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
                FlatButton(
                  color: Colors.green,
                  onPressed: () async {
                    _deleteCourse(path);
                    Navigator.pop(context);
                  },
                  child: Text('Confirm'),
                ),
              ],
              title: Text('Confirm delete'),
              content: Text('Do you want to delete this course?'));
        });
  }

  Widget cardCourse(BuildContext context, AsyncSnapshot<QuerySnapshot> as) {
    final snapshotData = as.data;
    final lists = snapshotData.docs.toList();
    return ListView.builder(
        itemCount: lists.length,
        itemBuilder: (context, index) {
          //String path = lists[index]['courseName'];
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => viewCourse(
                                  courseCode: lists[index]['courseCode'])));
                    },
                    title: Text(lists[index]['courseCode']),
                    subtitle: Text(lists[index]['lecturerName']),
                    trailing:
                        Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditCourse(
                                    courseCode: lists[index]['courseCode']))),
                        icon: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                      ),
                      IconButton(
                        onPressed: () =>
                            _showDeleteForm(lists[index]['courseCode']),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ])

                    /*PopupMenuButton(
                      onSelected: (item) => onSelected(context, item),
                      itemBuilder: (context) => [
                            PopupMenuItem(value: 0, child: Text('Edit Course')),
                            PopupMenuItem(value: 1, child: Text('Delete'))
                          ]),*/
                    ),
              ],
            ),
          );
        });
  }
}
