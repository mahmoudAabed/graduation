import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/constance.dart';
import 'package:graduation/core/view_model/control_model.dart';
import 'package:graduation/core/view_model/cart_view_model.dart';
import 'package:graduation/core/view_model/home_view_model.dart';
import 'package:graduation/model/activity.dart';
import 'package:graduation/model/user_model.dart';
import 'package:graduation/view/edit_activity_view.dart';
import 'package:graduation/view/home_screen.dart';
import 'package:graduation/view/widgets/custom_text.dart';

class DetailsView extends StatelessWidget {
  late Activity activity;

  DetailsView(this.activity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              GetBuilder<HomeViewModel>(
                builder: (controller) {
                  return Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Get.back(result: HomeScreen()),
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                            ),
                          ),
                          if (ControlModel.to.userData.value != null &&
                              ControlModel.to.userData.value!.isAdmin)
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black),
                              ),
                              onPressed: () =>
                                  Get.offAll(() => EditActivityView(
                                        activity: activity,
                                      )),
                              child: Text(
                                'EDIT',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          activity.image!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: double.infinity,
                    height: 200,
                  );
                },
              ),
              const SizedBox(height: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: CustomText(
                      text: activity.name!,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 10, right: 20),
                          child: Text(
                            activity.description!,
                            style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                height: 1.3,
                                wordSpacing: 0.5),
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 45),
                        child: CustomText(text: 'Cost', fontSize: 20),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: primaryColor, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                              width: 100,
                              height: 50,
                              padding: EdgeInsets.all(10),
                              child: Text(
                                activity.cost.toString(),
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800,
                                  color: primaryColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            GetBuilder<HomeViewModel>(
                              builder: (controller) => TextButton(
                                  onPressed: () {
                                    print('sdc');
                                    addData();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        border: Border.all(width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                      ),
                                      height: 50,
                                      padding: EdgeInsets.all(10),
                                      child: const CustomText(
                                        text: 'Book now',
                                        fontSize: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  addData() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;

    FirebaseFirestore.instance.collection('activityCart').add({
      'name': activity.name,
      'cost': activity.cost,
      'image': activity.image,
      'userId': uid,
    }).then((value) => value.update({'id': value.id}));
    print(auth.currentUser?.email);
    print("----------------------------------");
  }
}
