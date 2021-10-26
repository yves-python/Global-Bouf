// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';


class Authentification {
  var auth = FirebaseAuth.instance; // instantiation

  User? utilisateur(User? user) {
    return user != null ? user : null;
  }

// etat de connection 
  Stream<User?> get users{
      return auth.authStateChanges().map(utilisateur);
  }

  // fonction de connection
  Future connection_Email_Pw(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user; // recuperarion de l'utilisateur
      return utilisateur(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // fonction de dinscription
  Future inscription_Email_Pw(String email, String password) async {
    try {
      UserCredential userCredential = await auth. createUserWithEmailAndPassword( 
          email: email, password: password);
      User? user = userCredential.user; // recuperarion de l'utilisateur
      return utilisateur(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
