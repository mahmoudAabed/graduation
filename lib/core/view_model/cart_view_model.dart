import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:graduation/core/view_model/control_model.dart';
import 'package:graduation/core/services/home_service.dart';
import 'package:graduation/core/view_model/register_model.dart';
import 'package:graduation/model/cart_activity_model.dart';

class CartViewModel extends GetxController {
  List<CartActivityModel> get cartActivity => _cartActivity;
  final List<CartActivityModel> _cartActivity = [];

  CartViewModel() {
    getCart();
  }

  getCart() async {
    FirebaseFirestore.instance
        .collection('activityCart')
        .where('userId', isEqualTo: ControlModel.to.userData.value!.userId)
        .get()
        .then((value) {
      for (var doc in value.docs) {
        _cartActivity.add(CartActivityModel.fromJson(doc.data()));
      }

      update();
    });
  }

  deleteItemFromCart(CartActivityModel cart) async {
    await FirebaseFirestore.instance
        .collection('activityCart')
        .doc(cart.id)
        .delete();
    _cartActivity.remove(cart);
    update();

    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

  String total() {
    int total = 0;
    for (int i = 0; i < cartActivity.length; i++) {
      total += cartActivity[i].cost!;
    }

    return total.toString();
  }
}
