import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_home/home_body/home_body.dart';
import 'bottom_home/home_body/part/bottombar.dart';

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
        appBar: AppBar(
          centerTitle: true,
          title: CustomText(
            text: "Overview",
            textColor: Colors.white,
            fontsize: 22,
          ),
          backgroundColor: Colors.indigo,
        ),
        body: Obx(() => controller.bottomPage[controller.bottomIndex.value]),
        bottomNavigationBar: CustomBottombar(controller: controller),
      ),
    );
  }
}
