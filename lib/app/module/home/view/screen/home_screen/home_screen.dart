import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/app/core/utils/shimmer/home_shimmer.dart';
import 'package:finance_management/app/data/model/firebase_get_model.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/widget/custom_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'bottom_home/home_body/part/bottombar.dart';
import 'bottom_home/widget/floating_action.dart';
import 'custom_Appbar/custom_appbar.dart';
import 'drawer_item/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didpop, result) async {
          if (didpop) {
            return;
          }
          final souldpop = await showDialog(
            context: context,
            builder: (context) {
              return CustomAlertDia(
                yesOntap: () {
                  Navigator.pop(context, true);
                },
                noOntap: () {
                  Navigator.pop(context, false);
                },
                title: "PopApp_title".tr,
                body: "PopApp_body".tr,
              );
            },
          );
          if (souldpop == true) {
            SystemNavigator.pop();
          }
        },
        child: Scaffold(
          drawer: MainDrawerItem(),
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(41.h),
            child: AllAppbar(controller: controller),
          ),
          body: GetBuilder<HomeController>(
            builder: (con) {
              if (con.userStream == null) {
                return Center(child: HomeShimmer());
              }
              return StreamBuilder<DocumentSnapshot>(
                stream: controller.userStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return HomeShimmer();
                  }
                  if (snapshot.hasData) {
                    FirebaseGetModel modelData = FirebaseGetModel();
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;
                    modelData = FirebaseGetModel.fromJson(data);
                    controller.userAllData.value = modelData;
                    return Obx(
                      () => con.bottomPage[controller.bottomIndex.value],
                    );
                  }
                  return Center(child: HomeShimmer());
                },
              );
            },
          ),
          bottomNavigationBar: CustomBottombar(controller: controller),
          floatingActionButton: floating_action(controller: controller),
        ),
      ),
    );
  }
}
