import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/model/user_model.dart';
import 'package:graduation/view/auth/login_screen.dart';

class ControlModel extends GetxController {
  Widget body = LoginScreen();
  Rxn<User> user = Rxn<User>();

  FirebaseAuth auth = FirebaseAuth.instance;

  Rx<UserModel?> userData = Rx(null);

  static ControlModel get to => Get.find();
  @override
  void onInit() async {
    auth.authStateChanges().listen((User? useruser) async {
      if (useruser == null) {
        user.value = null;
        userData.value = null;
      } else {
        user.value = useruser;
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(useruser.uid)
            .get()
            .then((value) {
          userData.value = UserModel.fromJson(value.data()!);
        });
      }
    });

    super.onInit();
  }

  changeBody(Widget newbody) {
    body = newbody;
    update();
  }
}
