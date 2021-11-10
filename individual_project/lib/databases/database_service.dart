import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:individual_project/functions/functions.dart';


class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<AppUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _fAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return AppUser.fromFirebase(user!);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<AppUser?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _fAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return AppUser.fromFirebase(user!);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future logOut() async {
    await _fAuth.signOut();
  }

  Stream<AppUser?> get currentUser {
    return _fAuth
        .authStateChanges()
        .map((User? user) => user != null ? AppUser.fromFirebase(user) : null);
  }
}

void insert(String firstNumber, String func,String secondNumber,String result, String time,{String equals= '='} ){
  List a= [firstNumber,func,secondNumber,equals,result ,time];
  FirebaseFirestore.instance.collection('histories').add({'history': a});
}
