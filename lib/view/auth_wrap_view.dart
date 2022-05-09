import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/core/view_model/control_model.dart';

class AuthWrapView extends StatelessWidget {
  const AuthWrapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlModel>(
      builder: (controller) {
        return controller.body;
      },
    );
  }
}
