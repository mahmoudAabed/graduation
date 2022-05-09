import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/core/view_model/cart_view_model.dart';
import 'package:graduation/view/widgets/custom_text.dart';
import '../constance.dart';
import '../core/view_model/home_view_model.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: GetBuilder<CartViewModel>(
          init: CartViewModel(),
          builder: ((controller) => Column(
            children: [
              Expanded(
                  child: Container(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 120,
                          width: 50,
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                child: Image.network(
                                    controller.cartActivity[index].image!),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 15, top: 0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: controller
                                            .cartActivity[index].name!,
                                        fontSize: 15,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      CustomText(
                                        color: primaryColor,
                                        text:
                                        '\$${controller.cartActivity[index].cost}',
                                        fontSize: 20,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red)),
                                        child: Row(
                                          children: [
                                            Icon(Icons.delete),
                                            Text(
                                              'delete'.toUpperCase(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        onPressed: () => Get.dialog(
                                          SizedBox(
                                            height: 200,
                                            child: Dialog(
                                              child: SizedBox(
                                                height: Get.height / 3,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      18.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
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
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                            onPressed: () => controller
                                                                .deleteItemFromCart(
                                                                controller
                                                                    .cartActivity[
                                                                index]),
                                                          ),
                                                          ElevatedButton(
                                                            child: Text(
                                                              'Cancel'
                                                                  .toUpperCase(),
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
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
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        );
                      },
                      itemCount: controller.cartActivity.length,
                      separatorBuilder: (BuildContext context, int index) {
                        controller.total();
                        return const SizedBox(
                          height: 20,
                        );
                      },
                    ),
                  )),
              const SizedBox(
                height: 40,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const CustomText(
                            text: 'TOTAL',
                            fontSize: 22,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomText(
                            text: '\$ ${controller.total()}',
                            color: primaryColor,
                            fontSize: 18,
                          ),
                        ],
                      ),
                      Container(
                          height: 50,
                          width: 150,
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(
                                      primaryColor)),
                              onPressed: () {
                                Get.snackbar("Sucssful", " ",
                                    backgroundColor: Colors.black12,
                                    colorText: primaryColor,
                                    maxWidth: double.infinity,
                                    duration: const Duration(seconds: 30),
                                    snackPosition: SnackPosition.TOP,
                                    padding: const EdgeInsets.all(20),
                                    margin: const EdgeInsets.all(20),
                                    messageText: const CustomText(
                                      text: "thanks for booking",
                                      fontSize: 20,
                                      color: primaryColor,
                                    ));
                              },
                              child: const Text(
                                'CHECKOUT',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )))
                    ],
                  ))
            ],
          )),
        ));
  }
}
