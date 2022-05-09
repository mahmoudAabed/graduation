import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation/core/view_model/control_model.dart';
import '../../constance.dart';
import '../../core/view_model/register_model.dart';
import '../widgets/custom_text.dart';
import 'login_screen.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterModel>(
        init: RegisterModel(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () => ControlModel.to.changeBody(LoginScreen()),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomText(
                      text: 'Sing Up',
                      fontSize: 30,
                      color: Colors.black,
                      alignment: Alignment.topLeft,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        CustomText(
                            text: 'Name',
                            fontSize: 14,
                            color: Colors.grey.shade900),
                        TextField(
                          controller: controller.nameCtrl,
                          decoration: const InputDecoration(
                              hintText: 'Mahmoud',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              fillColor: Colors.white),
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
                          keyboardType: TextInputType.emailAddress,
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
                          onPressed: () => controller.sinUpInPassAndEmail(),
                          child: const Text(
                            'Sing Up',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          color: primaryColor,
                          padding: const EdgeInsets.all(10),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
