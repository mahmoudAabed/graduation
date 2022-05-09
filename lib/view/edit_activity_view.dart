import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:graduation/core/view_model/edit_activity_model.dart';
import 'package:graduation/model/activity.dart';
import 'package:graduation/view/control_view.dart';

class EditActivityView extends StatelessWidget {
  Activity? activity;
  EditActivityView({Key? key, this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditActivityModel>(
      init: EditActivityModel(activity),
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Edit activity'),
              centerTitle: true,
              leading: IconButton(
                onPressed: () => Get.off(() => ControlView()),
                icon: Icon(
                  Icons.arrow_back,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(18),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          keyboardType: TextInputType.text,
                          controller: controller.nameCtrl,
                          onChanged: (value) =>
                              controller.changeNameText(value),
                          decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(.5),
                              fontSize: 16,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(.5), width: 2),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(15, 5, 15, 5),
                          ),
                        ),
                        if (controller.nameError.isNotEmpty)
                          SizedBox(height: 10),
                        if (controller.nameError.isNotEmpty)
                          Text(
                            controller.nameError,
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        const SizedBox(height: 20),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: controller.costCtrl,
                          onChanged: (value) =>
                              controller.changeCostText(value),
                          decoration: InputDecoration(
                            hintText: "Cost",
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(.5),
                              fontSize: 16,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(.5), width: 2),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(15, 5, 15, 5),
                          ),
                        ),
                        if (controller.costError.isNotEmpty)
                          SizedBox(height: 10),
                        if (controller.costError.isNotEmpty)
                          Text(
                            controller.costError,
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        const SizedBox(height: 20),
                        TextField(
                          keyboardType: TextInputType.text,
                          controller: controller.imgCtrl,
                          onChanged: (value) => controller.changeImgText(value),
                          decoration: InputDecoration(
                            hintText: "Image",
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(.5),
                              fontSize: 16,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(.5), width: 2),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(15, 5, 15, 5),
                          ),
                        ),
                        if (controller.imgError.isNotEmpty)
                          SizedBox(height: 10),
                        if (controller.imgError.isNotEmpty)
                          Text(
                            controller.imgError,
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        const SizedBox(height: 20),
                        TextField(
                          keyboardType: TextInputType.text,
                          controller: controller.descCtrl,
                          decoration: InputDecoration(
                            hintText: "Description",
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(.5),
                              fontSize: 16,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(.5), width: 2),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(15, 5, 15, 5),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ButtonStyle(
                          fixedSize:
                              MaterialStateProperty.all(Size(Get.width, 50))),
                      child: controller.isLoading
                          ? Container(
                              width: 50,
                              height: Get.width / 60,
                              child: const LinearProgressIndicator(
                                color: Color.fromARGB(255, 24, 60, 241),
                                backgroundColor: Colors.white,
                              ),
                            )
                          : Text(
                              'Edit'.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                      onPressed: () => controller.isLoading
                          ? null
                          : controller.editActivity(),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
