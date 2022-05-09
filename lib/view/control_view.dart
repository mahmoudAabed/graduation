import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/core/view_model/control_model.dart';
import 'package:graduation/view/auth_wrap_view.dart';

import 'package:graduation/view/main_layout_view.dart';

class ControlView extends GetWidget<ControlModel> {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.user.value == null) {
        return AuthWrapView();
      } else {
        return MainLayoutView();
      }
    });
  }
}
