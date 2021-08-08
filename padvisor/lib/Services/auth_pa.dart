import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:padvisor/model/pa_user.dart';

class AuthPaService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String uid;

  AuthPaService({this.uid});

  final CollectionReference paCollection =
      FirebaseFirestore.instance.collection('pa');

//method to allow PA to change data
//not finished yet

  Future updateUserData(
      String name,
      String pw,
      String pic,
      String faculty,
      String dept,
      String room,
      String phone,
      String email,
      String wechat) async {
    return await paCollection.doc(uid).set({
      'name': name,
      'password': pw,
      'picture': pic,
      'faculty': faculty,
      'department': dept,
      'room no.': room,
      'phone num': phone,
      'email': email,
      'wechatid': wechat
    });
  }

  // create user from firebase user
  paUser _userFromFirebaseUser(User user) {
    return user != null ? paUser(uid: user.uid) : null;
  }

  // auth change pa user stream
  Stream<paUser> get user {
    return _auth
        .authStateChanges()
        .map((User user) => _userFromFirebaseUser(user));
    //.map(_userFromFirebaseUser);
  }

  //sign in pa with email and password
  Future signInPa(String email, String password) async {
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

  //register pa with email and password
  Future registerPa(String email, String password) async {
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

  // Stream<QuerySnapshot> get user {
  //   return paCollection.snapshots();
  // }
}
