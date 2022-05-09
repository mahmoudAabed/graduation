import 'package:get/get.dart';
import 'package:graduation/core/view_model/signin_model.dart';

import '../core/view_model/register_model.dart';
import '../core/view_model/main_layout_model.dart';
import '../core/view_model/home_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterModel());
    Get.lazyPut(() => SignInModel());
    Get.lazyPut(() => MainLayoutModel());
    Get.lazyPut(() => HomeViewModel());
    // Get.lazyPut(() => CartViewModel());
  }
}
