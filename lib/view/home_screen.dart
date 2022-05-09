import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/core/view_model/control_model.dart';
import 'package:graduation/view/add_new_activity_view.dart';
import 'package:graduation/view/details_view.dart';
import 'package:graduation/view/widgets/custom_text.dart';
import '../core/view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) => Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade200),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const CustomText(
                        text: 'Categories',
                        color: Colors.black,
                        fontSize: 20,
                        alignment: Alignment.topLeft,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      GetBuilder<HomeViewModel>(
                        builder: (controller) => Container(
                            height: 100,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.categoryModel.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.grey.shade100),
                                      width: 60,
                                      height: 60,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(controller
                                            .categoryModel[index].image),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomText(
                                      text:
                                          controller.categoryModel[index].name,
                                      color: Colors.black,
                                      fontSize: 16,
                                    )
                                  ],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(
                                width: 20,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      if (ControlModel.to.userData.value != null &&
                          ControlModel.to.userData.value!.isAdmin)
                        GestureDetector(
                          onTap: () => Get.off(() => AddNewActivityView()),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Add new activity',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Icon(Icons.add),
                            ],
                          ),
                        ),
                      if (ControlModel.to.userData.value != null &&
                          ControlModel.to.userData.value!.isAdmin)
                        const SizedBox(
                          height: 20,
                        ),
                      Container(
                        height: 420,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.activity.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      child: Column(
                                        children: [
                                          InkWell(
                                            child: Container(
                                              height: 250,
                                              child: Image.network(
                                                controller
                                                    .activity[index].image!,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            onTap: () =>
                                                Get.to(() => DetailsView(
                                                      controller
                                                          .activity[index],
                                                    )),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomText(
                                      text: controller.activity[index].name!,
                                      fontSize: 16,
                                      alignment: Alignment.bottomLeft,
                                      color: Colors.black87,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                                if (ControlModel.to.userData.value != null &&
                                    ControlModel.to.userData.value!.isAdmin)
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: IconButton(
                                      onPressed: () => Get.dialog(
                                        SizedBox(
                                          height: 200,
                                          child: Dialog(
                                            child: SizedBox(
                                              height: Get.height / 3,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(18.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Are you sure u want to delete this activity?',
                                                    ),
                                                    SizedBox(height: 20),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        ElevatedButton(
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all(Colors
                                                                          .red)),
                                                          child: Text(
                                                            'Delete'
                                                                .toUpperCase(),
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                          onPressed: () => controller
                                                              .deleteActivity(
                                                                  controller
                                                                      .activity[
                                                                          index]
                                                                      .id!),
                                                        ),
                                                        ElevatedButton(
                                                          child: Text(
                                                            'Cancel'
                                                                .toUpperCase(),
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                          onPressed: () =>
                                                              Get.back(),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      icon: CircleAvatar(
                                        backgroundColor: Colors.red,
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            width: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
