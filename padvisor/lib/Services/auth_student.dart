import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:padvisor/model/student_user.dart';

class AuthStudentService {
  //firesbase authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //unique user id
  final String uid;

  //constructor for AuthStudentService class
  AuthStudentService({this.uid});

  // reference to Student collection in firestore
  // CollectionReference studentCollection =
  //     FirebaseFirestore.instance.collection('Student');

  //
  //
  // Method to create Student user from firebase user
  studentUser _userFromFirebaseUser(User user) {
    return user != null ? studentUser(uid: user.uid) : null;
  }

  //Method to register new student
  Future registerStudent(String email, String password) async {
    try {
      UserCredential _result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = _result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in Student with email and password
  Future signInStudent(String email, String password) async {
    try {
      UserCredential _result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = _result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
