import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_baibu/adminscreens/AdminHomePage.dart';
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
}
