import 'dart:developer';

import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../Global_widget/custom_text.dart';

class LanguageSlide extends StatelessWidget {
  const LanguageSlide({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      margin: EdgeInsets.only(right: 5),
      height: 25.h,
      width: 59.5.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(10),
        color: Colors.transparent,
        border: BoxBorder.all(color: Colors.black),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Obx(
            () => AnimatedAlign(
              duration: Duration(milliseconds: 200),
              alignment: controller.languageSlide.value == true
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                height: 22.h,
                width: 27.5.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(8),
                  color: Colors.teal,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () async {
                  controller.languageSlide.value = true;
                  Get.updateLocale(Locale("bn", "BD"));
                  await LocalStorage().writeData(key: "language", value: "B");
                },
                child: CustomText(
                  text: "BN",
                  fontsize: 11.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  controller.languageSlide.value = false;
                  Get.updateLocale(Locale("en", "US"));
                  await LocalStorage().writeData(key: "language", value: "E");
                },
                child: CustomText(
                  text: "EN",
                  fontsize: 11.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
