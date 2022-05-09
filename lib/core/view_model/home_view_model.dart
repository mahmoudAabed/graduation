import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:graduation/core/services/firestore_user.dart';
import 'package:graduation/model/activity.dart';
import 'package:graduation/model/cart_activity_model.dart';
import 'package:graduation/model/user_model.dart';

import '../../model/category_model.dart';
import '../services/home_service.dart';
import 'register_model.dart';

class HomeViewModel extends GetxController {
  List<CategoryModel> get categoryModel => _categoryModel;
  final List<CategoryModel> _categoryModel = [];

  List<Activity> activity = [];

  HomeViewModel() {
    getCategory();
    getActivity();
  }

  getCategory() async {
    HomeService().getCategory().then((dynamic value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data()));
      }

      update();
    });
  }

  getActivity() async {
    HomeService().getActivity().then((dynamic value) {
      for (int i = 0; i < value.length; i++) {
        activity.add(Activity.fromJson(value[i].data()));
      }

      update();
    });
  }

  deleteActivity(String id) async {
    await FirebaseFirestore.instance
        .collection('activityimage')
        .doc(id)
        .delete();

    activity.removeWhere((e) => e.id == id);
    update();
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}
