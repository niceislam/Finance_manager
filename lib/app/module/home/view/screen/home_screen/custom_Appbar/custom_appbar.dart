import 'package:finance_management/app/module/home/Global_widget/custom_appbar.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/language_slide.dart';

class AllAppbar extends StatelessWidget {
  const AllAppbar({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int val = controller.bottomIndex.value;
      return val == 0
          ? CustomAppbar(
              centerText: "home_title".tr,
              actionIcon: LanguageSlide(controller: controller),
            )
          : val == 1
          ? CustomAppbar(
              centerText: "Btm_Tr".tr,
              actionIcon: Icon(Icons.more_vert, color: Colors.white, size: 30),
            )
          : val == 2
          ? CustomAppbar(centerText: "Btm_Rp".tr)
          : SizedBox();
    });
  }
}
