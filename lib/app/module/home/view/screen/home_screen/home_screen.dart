import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_home/home_body/home_body.dart';
import 'bottom_home/home_body/part/bottombar.dart';
import 'bottom_home/widget/floating_action.dart';
import 'custom_Appbar/custom_appbar.dart';

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
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AllAppbar(controller: controller),
        ),
        body: Obx(() => controller.bottomPage[controller.bottomIndex.value]),
        bottomNavigationBar: CustomBottombar(controller: controller),
        floatingActionButton: floating_action(controller: controller),
      ),
    );
  }
}
