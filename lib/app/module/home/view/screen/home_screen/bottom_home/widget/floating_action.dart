import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class floating_action extends StatelessWidget {
  const floating_action({super.key, required this.controller});

  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.bottomIndex.value == 0
          ? SlideTransition(
              position: controller.offsetAnimation,
              child: GestureDetector(
                onTap: () {
                  controller.floatingTap();
                },
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.teal,
                  ),
                  child: Center(
                    child: Icon(Icons.add, size: 25, color: Colors.white),
                  ),
                ),
              ),
            )
          : SizedBox(),
    );
  }
}
