import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/core/view_model/control_model.dart';
import 'package:graduation/core/view_model/signin_model.dart';
import 'package:graduation/view/auth/register_view.dart';
import '../../constance.dart';
import '../../core/view_model/register_model.dart';
import '../widgets/custom_text.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignInModel>(
        init: SignInModel(),
        builder: (controller) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                            text: 'Welcome',
                            fontSize: 30,
                            color: Colors.black,
                            alignment: Alignment.topLeft,
                          ),
                          GestureDetector(
                            onTap: () =>
                                ControlModel.to.changeBody(RegisterView()),
                            child: const CustomText(
                              text: 'sing Up',
                              fontSize: 20,
                              color: primaryColor,
                              alignment: Alignment.topRight,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: 'Sing in to continue',
                            fontSize: 15,
                            color: Colors.grey,
                            alignment: Alignment.topLeft,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomText(
                              text: 'Email',
                              fontSize: 14,
                              color: Colors.grey.shade900),
                          TextField(
                            controller: controller.emailCtrl,
                            decoration: const InputDecoration(
                                hintText: 'Email@xxx.com',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                fillColor: Colors.white),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomText(
                              text: 'Password',
                              fontSize: 14,
                              color: Colors.grey.shade900),
                          TextField(
                            obscureText: true,
                            controller: controller.passwordCtrl,
                            decoration: const InputDecoration(
                                hintText: '******',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                fillColor: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: const CustomText(
                              text: 'Forget password?',
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          if (controller.error.isNotEmpty) SizedBox(height: 10),
                          if (controller.error.isNotEmpty)
                            Text(
                              controller.error,
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          const SizedBox(
                            height: 30,
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            minWidth: double.infinity,
                            height: 40,
                            onPressed: () => controller.loginInPassAndEmail(),
                            child: const Text(
                              'Sing in',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            color: primaryColor,
                            padding: const EdgeInsets.all(10),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      const CustomText(
                        text: '-OR-',
                        alignment: Alignment.center,
                        fontSize: 20,
                      ),
                      FlatButton(
                        child: Row(
                          children: const [
                            Icon(
                              Icons.email,
                              color: Colors.blueAccent,
                              size: 25,
                            ),
                            SizedBox(
                              width: 45,
                            ),
                            Text(
                              'Sing in whit google',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FlatButton(
                        child: Row(
                          children: const [
                            Icon(
                              Icons.phone,
                              color: Colors.blueAccent,
                              size: 25,
                            ),
                            SizedBox(
                              width: 45,
                            ),
                            Text(
                              'Sing in whit phone',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
