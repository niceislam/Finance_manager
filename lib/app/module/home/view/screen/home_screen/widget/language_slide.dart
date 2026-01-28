import 'dart:developer';

import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:flutter/material.dart';
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
      height: 30,
      width: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(10),
        color: Colors.transparent,
        border: BoxBorder.all(color: Colors.black),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              Obx(
                () => AnimatedContainer(
                  margin: EdgeInsets.only(
                    left: controller.languageSlide.value == true ? 0 : 30.5,
                  ),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(8),
                    color: Colors.white,
                  ),
                  duration: Duration(milliseconds: 200),
                ),
              ),
            ],
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
                  fontsize: 12,
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
                  fontsize: 12,
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
