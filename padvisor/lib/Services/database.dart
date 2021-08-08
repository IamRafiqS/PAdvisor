import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:padvisor/model/list_advisee.dart';

class DatabaseServices {
  //reference to PA collection
  final CollectionReference paCollection =
      FirebaseFirestore.instance.collection('paData');

  //reference to Student collection
  final CollectionReference studentCollection =
      FirebaseFirestore.instance.collection('StudentData');

  //reference to HOD collection
  final CollectionReference hodCollection =
      FirebaseFirestore.instance.collection('hodData');

  //reference to which advisor with which advisees
  final CollectionReference adviseeCollection =
      FirebaseFirestore.instance.collection('AdvisorAdvisee');

  final String uid;

  DatabaseServices({this.uid});

  //method to register new PA
  Future registerUserData(
      String name,
      String password,
      String faculty,
      String dept,
      String room,
      String phone,
      String email,
      String wechat,
      String staffId) async {
    return await paCollection.doc(uid).set({
      'name': name,
      'StaffId': staffId,
      'password': password,
      'faculty': faculty,
      'department': dept,
      'roomNo': room,
      'phone num': phone,
      'email': email,
      'wechatid': wechat,
      'category': 'pa',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/padvisor-24103.appspot.com/o/files%2Fdefaultprofile.png?alt=media&token=4fd7cd2e-d8f0-4008-8db4-fd473d643fdd'
    });
  }

  //method to update user pa data
  Future<void> updateUserData(
      String name,
      String password,
      String faculty,
      String dept,
      String room,
      String phone,
      String email,
      String wechat,
      String staffId) async {
    return await paCollection.doc(uid).update({
      'name': name,
      'StaffId': staffId,
      'password': password,
      'faculty': faculty,
      'department': dept,
      'roomNo': room,
      'phone num': phone,
      'email': email,
      'wechatid': wechat
    });
  }

//method to register new student
  Future registerStudentData(
      String name,
      String matric,
      String password,
      String ic,
      String sem,
      String cohort,
      String phone,
      String email,
      String wechat) async {
    return await studentCollection.doc(uid).set({
      'name': name,
      'MatricNo': matric,
      'password': password,
      'IC': ic,
      'Semester': sem,
      'Cohort': cohort,
      'phone num': phone,
      'email': email,
      'wechatid': wechat,
      'category': 'student',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/padvisor-24103.appspot.com/o/files%2Fdefaultprofile.png?alt=media&token=4fd7cd2e-d8f0-4008-8db4-fd473d643fdd'
    });
  }

  //method to update student data
  Future<void> updateStudentData(
      String name,
      String matric,
      String password,
      String ic,
      String sem,
      String cohort,
      String phone,
      String email,
      String wechat) async {
    return await studentCollection.doc(uid).update({
      'name': name,
      'MatricNo': matric,
      'password': password,
      'IC': ic,
      'Semester': sem,
      'Cohort': cohort,
      'phone num': phone,
      'email': email,
      'wechatid': wechat
    });
  }

  //method to register new HOD
  Future registerHodData(
    String name,
    String staffId,
    String password,
    String phone,
    String faculty,
    String dept,
    String room,
    String email,
    String wechat,
  ) async {
    return await hodCollection.doc(uid).set({
      'name': name,
      'StaffId': staffId,
      'password': password,
      'faculty': faculty,
      'department': dept,
      'roomNo': room,
      'phone num': phone,
      'email': email,
      'wechatid': wechat,
      'category': 'hod',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/padvisor-24103.appspot.com/o/files%2Fdefaultprofile.png?alt=media&token=4fd7cd2e-d8f0-4008-8db4-fd473d643fdd'
    });
  }

  //method to update hod data
  Future<void> updateHodData(
    String name,
    String staffId,
    String password,
    String phone,
    String faculty,
    String dept,
    String room,
    String email,
    String wechat,
  ) async {
    return await hodCollection.doc(uid).update({
      'name': name,
      'StaffId': staffId,
      'password': password,
      'faculty': faculty,
      'department': dept,
      'roomNo': room,
      'phone num': phone,
      'email': email,
      'wechatid': wechat
    });
  }

  //method to add course
  Future<void> addCourse(
      String courseCode,
      String courseName,
      String lecturerName,
      String assessment1,
      String assessment2,
      String attendance) async {
    return await studentCollection
        .doc(uid)
        .collection('courses')
        .doc(courseCode)
        .set({
      'courseCode': courseCode,
      'courseName': courseName,
      'lecturerName': lecturerName,
      'assessment1': assessment1,
      'assessment2': assessment2,
      'attendance': attendance,
    });
  }

  // method to edit course
  Future<void> editCourse(
      String currentCode,
      //String courseCode,
      String courseName,
      String lecturerName,
      String assessment1,
      String assessment2,
      String attendance) async {
    return await studentCollection
        .doc(uid)
        .collection('courses')
        .doc(currentCode)
        .update({
      'courseCode': currentCode,
      'courseName': courseName,
      'lecturerName': lecturerName,
      'assessment1': assessment1,
      'assessment2': assessment2,
      'attendance': attendance,
    });
  }

  // method to register advisee to specific pa
  Future registerAdvisee(String matric, String name, String cohort) async {
    return await adviseeCollection
        .doc(uid)
        .collection('student')
        .doc(matric)
        .set({'matricNo': matric, 'name': name, 'cohort': cohort});
  }

  //
  //
  Future registerArchive(String matric, String name, String cohort) async {
    return await adviseeCollection
        .doc(uid)
        .collection('archive')
        .doc(matric)
        .set({
      'matricNo': matric,
      'name': name,
      'Cohort': cohort,
    });
  }

  //method to sent message
  Future<void> sentMessage(
      String senderEmail,
      String senderCategory,
      String recipientEmail,
      String recipientCategory,
      String recipientID,
      String message) async {
    receiveMessage(senderEmail, message, recipientCategory, recipientID);
    return await FirebaseFirestore.instance
        .collection(senderCategory)
        .doc(uid)
        .collection('Sent Message')
        .doc()
        .set({'recipientEmail': recipientEmail, 'message': message});
  }

  //method to receive message
  Future<void> receiveMessage(String senderEmail, String message,
      String category, String recipientID) async {
    return await FirebaseFirestore.instance
        .collection(category)
        .doc(recipientID)
        .collection('Inbox Message')
        .doc()
        .set({'senderEmail': senderEmail, 'message': message});
  }

  //get pa data streams
  Stream<QuerySnapshot> get paData {
    return paCollection.snapshots();
  }

  Stream<QuerySnapshot> get studentData {
    return studentCollection.snapshots();
  }

  DocumentReference get specificStudentData {
    return studentCollection.doc(uid);
  }

  Stream<QuerySnapshot> get listAdvisee {
    //Stream<List<ListAdvisee>> get listAdvisee {
    //reference to list of advisee for each advisor
    final CollectionReference adviseeListCollection = FirebaseFirestore.instance
        .collection('AdvisorAdvisee')
        .doc(uid)
        .collection('student');

    return adviseeListCollection.snapshots();
  }

  List<ListAdvisee> _listofAdviseeFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return ListAdvisee(name: doc['name'], matricNo: doc['matricNo']);
    });
  }
}
