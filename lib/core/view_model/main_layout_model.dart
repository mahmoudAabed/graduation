import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation/model/user_model.dart';

import '../../view/cart_view.dart';
import '../../view/home_screen.dart';
import '../../view/profile_view.dart';

class MainLayoutModel extends GetxController {
  int _navigatorVal = 0;

  get navigatorVal => _navigatorVal;
  Widget _currentScreen = HomeScreen();

  get currentScreen => _currentScreen;

  void CahngeSelectedVal(int selectedValue) {
    _navigatorVal = selectedValue;

    switch (selectedValue) {
      case 0:
        _currentScreen = HomeScreen();
        break;
      case 1:
        _currentScreen = CartView();
        break;
      case 2:
        _currentScreen = ProfileView();
    }
    update();
  }
}
