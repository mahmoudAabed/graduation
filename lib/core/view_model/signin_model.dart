import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/core/view_model/control_model.dart';
import 'package:graduation/model/user_model.dart';

class SignInModel extends GetxController {
  final TextEditingController emailCtrl = TextEditingController(text: '');
  final TextEditingController passwordCtrl = TextEditingController(text: '');

  String error = '';

  void loginInPassAndEmail() async {
    error = '';
    update();
    if (emailCtrl.text.isEmpty || !emailCtrl.text.trim().isEmail) {
      error = 'Please insert correct email.';
      update();
    } else if (passwordCtrl.text.isEmpty) {
      error = 'Please insert your password.';
      update();
    }
    if (error.isEmpty) {
      try {
        ControlModel.to.auth
            .signInWithEmailAndPassword(
                email: emailCtrl.text.trim(), password: passwordCtrl.text)
            .then((value) async {
          print('user id: ' + value.user!.uid);
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          error = 'No user found for that email.';
          update();
        } else if (e.code == 'wrong-password') {
          error = 'Wrong password provided for that user.';
          update();
        }
      }
    } else {
      error = 'Please insert email and password';
      update();
    }
  }

  @override
  void dispose() {
    passwordCtrl.dispose();
    emailCtrl.dispose();

    super.dispose();
  }
}
