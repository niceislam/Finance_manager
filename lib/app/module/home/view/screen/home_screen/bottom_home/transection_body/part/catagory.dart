import 'dart:developer';

import 'package:finance_management/app/module/home/controller/transection_controller/transection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../Global_widget/custom_text.dart';

class App_catagory extends StatelessWidget {
  const App_catagory({super.key, required this.size, required this.controller});

  final Size size;
  final TransectionController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.teal.shade50,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller.CatagorySlide.value = true;
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Center(child: CustomText(text: "Today")),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller.CatagorySlide.value = false;
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Center(child: CustomText(text: "All")),
                    ),
                  ),
                ),
              ],
            ),
            AnimatedPositioned(
              onEnd: () {
                controller.onEnd.value = !controller.onEnd.value;
              },
              left: controller.CatagorySlide.isFalse ? 193 : 0,
              duration: Duration(milliseconds: 150),
              child: Container(
                height: 40,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.teal,
                ),
                child: Center(
                  child: CustomText(
                    text:
                        "${controller.onEnd.value == false ? "Today" : "All"}",
                    textColor: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
