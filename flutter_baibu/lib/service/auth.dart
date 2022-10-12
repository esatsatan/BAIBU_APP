import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_baibu/adminscreens/AdminHomePage/adminHomePage.dart';
import 'package:flutter_baibu/loginscreens/AdminLogin.dart';
import 'package:flutter_baibu/loginscreens/StudentLogin.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // login
  Future<User?> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  //signOut
  signOut() async {
    return await _auth.signOut();
  }

  // register
  Future<User?> createPerson(
      String name, String surname, String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore.collection("Users").doc(user.user?.uid).set({
      'username': name,
      'usersurname': surname,
      'email': email,
      'password': password
    });

    return user.user;
  }

  checkCurrentAdminUser() {
    if (_auth.currentUser!.email == 'murat.beken@ibu.edu.tr' &&
        _auth.currentUser != null) {
      return adminHomePage();
    } else {
      AdminLogin();
    }
  }

  checkUser() {
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('user signed out');
      } else {
        print('User is signed in!');
      }
    });
  }

  Future<bool> verifyEmail() async {
    bool isEmailverified = false;
    return true;
  }

  void resetPasswordLink(String email) async {
    User? user = _auth.currentUser;

    await _auth.sendPasswordResetEmail(email: user!.email.toString());
  }
}
