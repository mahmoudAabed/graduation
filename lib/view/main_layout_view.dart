import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/core/view_model/main_layout_model.dart';

class MainLayoutView extends StatelessWidget {
  const MainLayoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainLayoutModel>(
      init: MainLayoutModel(),
      builder: (controller) => Scaffold(
        body: controller.currentScreen,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text('Explore'),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.network(
                  'https://raw.githubusercontent.com/PesaCoder/Ecommerce_App/master/assets/images/Icon_Explore.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text('Cart'),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.network(
                  'https://raw.githubusercontent.com/PesaCoder/Ecommerce_App/master/assets/images/Icon_Cart.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text('User'),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.network(
                  'https://raw.githubusercontent.com/PesaCoder/Ecommerce_App/master/assets/images/Icon_User.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              ),
            ),
          ],
          currentIndex: controller.navigatorVal,
          onTap: (index) {
            controller.CahngeSelectedVal(index);
          },
          elevation: 0,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.grey.shade50,
        ),
      ),
    );
  }
}
