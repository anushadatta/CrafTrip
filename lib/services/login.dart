import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginModel {

  // Identifying users uniquely 
  static String userID;

  // Constructor to save userID session 
  LoginModel()
  {
    FirebaseAuth.instance.onAuthStateChanged.listen((firebaseUser) {
    userID = firebaseUser.uid;
    });
  }
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  Future<FirebaseUser> handleSignIn(var email, var password) async {
    try {
       user = (await _auth.signInWithEmailAndPassword(
          email: email, password: password)).user;
    } catch(e){
      user = null;
    }

    return user;
  }

}