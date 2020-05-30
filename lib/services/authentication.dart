import 'users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smit/services/users.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create a User from Firebase User
  User _userfromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid, email: user.email) : null;
  }

  //Auth Change User Stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userfromFirebaseUser);
  }

  //Register With Email And Password
  Future register(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser _user = result.user;
      return _userfromFirebaseUser(_user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Sign In
  Future SignIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser _user = result.user;
      return _userfromFirebaseUser(_user);
    } catch (e) {
      print("Exception:" + e.toString());
      print("Returning null");
      return null;
    }
  }

  //Signing Out
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future forgotpassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }
}
