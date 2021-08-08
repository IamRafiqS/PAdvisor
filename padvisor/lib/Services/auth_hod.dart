import 'package:firebase_auth/firebase_auth.dart';
import 'package:padvisor/model/hod_user.dart';

class AuthHodService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final String uid;

  AuthHodService({this.uid});

  // method to convert firebase user to hod user
  hodUser _userFromFirebaseUser(User user) {
    return user != null ? hodUser(uid: user.uid) : null;
  }

  // method to register new hod
  Future registerHod(String email, String password) async {
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

  // sign in HOD with email and password
  Future signInHod(String email, String password) async {
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
