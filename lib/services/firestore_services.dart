import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notebook/screens/login_screen.dart';

import '../screens/home_screen.dart';

final currentUser = FirebaseAuth.instance;

class API {
  final CollectionReference collectionReference = FirebaseFirestore.instance
      .collection("Notebook")
      .doc(currentUser.currentUser!.uid)
      .collection("Notes");

  Future signOut(BuildContext? context) async {
    await currentUser.signOut().then((value) {
      log("LogOut");
      Navigator.pushNamedAndRemoveUntil(
        context!,
        LoginScreen.idScreen,
        (route) => false,
      );
    });
  }

  Future deleteNote({
    String? id,
    BuildContext? context,
  }) async {
    try {
      await collectionReference.doc(id).delete().then((value) {
        log("Note Deleted");
        Navigator.pushNamedAndRemoveUntil(
          context!,
          HomeScreen.idScreen,
          (route) => false,
        );
      });
    } catch (e) {
      log(
        e.toString(),
      );
    }
  }

  Future addNote({
    String? title,
    String? content,
    BuildContext? context,
  }) async {
    try {
      await collectionReference.add({
        "title": "$title",
        "content": "$content",
      }).then((value) {
        log("Note Added");
        Navigator.pushNamedAndRemoveUntil(
          context!,
          HomeScreen.idScreen,
          (route) => false,
        );
      });
    } catch (e) {
      log(
        e.toString(),
      );
    }
  }

  Future signUp({
    String? email,
    String? password,
    BuildContext? context,
  }) async {
    try {
      await currentUser
          .createUserWithEmailAndPassword(
            email: email!.trim(),
            password: password!.trim(),
          )
          .then(
            (value) => Navigator.pushNamedAndRemoveUntil(
              context!,
              HomeScreen.idScreen,
              (route) => false,
            ),
          );
    } catch (e) {
      log(
        e.toString(),
      );
    }
  }

  Future signIn({
    String? email,
    String? password,
    BuildContext? context,
  }) async {
    try {
      await currentUser
          .signInWithEmailAndPassword(
            email: email!.trim(),
            password: password!.trim(),
          )
          .then(
            (value) => Navigator.pushNamedAndRemoveUntil(
              context!,
              HomeScreen.idScreen,
              (route) => false,
            ),
          );
    } catch (e) {
      log(
        e.toString(),
      );
    }
  }
}
