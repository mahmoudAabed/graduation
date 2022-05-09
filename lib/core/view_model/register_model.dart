import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/core/view_model/control_model.dart';
import 'package:graduation/view/main_layout_view.dart';
import '../../model/user_model.dart';

class RegisterModel extends GetxController {
  final TextEditingController nameCtrl = TextEditingController(text: '');
  final TextEditingController emailCtrl = TextEditingController(text: '');
  final TextEditingController passwordCtrl = TextEditingController(text: '');

  String error = '';

  void sinUpInPassAndEmail() async {
    error = '';
    update();
    if (nameCtrl.text.isEmpty) {
      error = 'Please insert your name.';
      update();
    } else if (emailCtrl.text.isEmpty || !emailCtrl.text.trim().isEmail) {
      error = 'Please insert correct email.';
      update();
    } else if (passwordCtrl.text.isEmpty) {
      error = 'Please insert your password.';
      update();
    } else if (passwordCtrl.text.length < 8) {
      error = 'Your password less than 8 chars.';
      update();
    }
    if (error.isEmpty) {
      try {
        await ControlModel.to.auth
            .createUserWithEmailAndPassword(
                email: emailCtrl.text.trim(), password: passwordCtrl.text)
            .then((value) async {
          print('user id: ' + value.user!.uid);
          UserModel userModel = UserModel(
            value.user!.uid,
            emailCtrl.text,
            nameCtrl.text,
            '',
            false,
          );

          await FirebaseFirestore.instance
              .collection('Users')
              .doc(value.user!.uid)
              .set(userModel.toJson());
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          error = 'The password provided is too weak.';
          update();
        } else if (e.code == 'email-already-in-use') {
          error = 'The account already exists for that email.';
          update();
        }
      }
    }
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    passwordCtrl.dispose();
    emailCtrl.dispose();

    super.dispose();
  }
}
