import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/core/services/home_service.dart';
import 'package:graduation/core/view_model/home_view_model.dart';
import 'package:graduation/model/activity.dart';
import 'package:graduation/view/control_view.dart';

class AddActivityModel extends GetxController {
  bool isLoading = false;
  final TextEditingController nameCtrl = TextEditingController(text: '');
  final TextEditingController costCtrl = TextEditingController(text: '');
  final TextEditingController imgCtrl = TextEditingController(text: '');
  final TextEditingController descCtrl = TextEditingController(text: '');

  String nameError = '';
  String costError = '';
  String imgError = '';

  changeNameText(String value) {
    if (value.isNotEmpty) {
      nameError = '';
      update();
    } else {
      nameError = 'Please insert activity name.';
      update();
    }
  }

  changeCostText(String value) {
    if (value.isNotEmpty) {
      costError = '';
      update();
    } else {
      costError = 'Please insert activity cost.';
      update();
    }
  }

  changeImgText(String value) {
    if (value.isNotEmpty) {
      imgError = '';
      update();
    } else {
      imgError = 'Please insert activity img.';
      update();
    }
  }

  void addNewActivity() async {
    isLoading = true;
    update();

    if (nameCtrl.text.isEmpty) {
      nameError = 'Please insert activity name.';
      update();
    }
    if (costCtrl.text.isEmpty) {
      costError = 'Please insert activity cost.';
      update();
    } else if (!costCtrl.text.isNum) {
      costError = 'Please insert numbers onlyasd.';
      update();
    }
    if (imgCtrl.text.isEmpty) {
      imgError = 'Please insert activity img.';
      update();
    }

    if (nameError.isEmpty && costError.isEmpty && imgError.isEmpty) {
      Activity activity = Activity(
        name: nameCtrl.text,
        image: imgCtrl.text,
        description: descCtrl.text,
        cost: int.parse(costCtrl.text),
      );

      await FirebaseFirestore.instance
          .collection('activityimage')
          .add(activity.toJson())
          .then(
        (value) {
          activity.id = value.id;
          value.update({'id': value.id});
        },
      );

      Get.off(() => ControlView());
    }

    isLoading = false;
    update();
  }
}
