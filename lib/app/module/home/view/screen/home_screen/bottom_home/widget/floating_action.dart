import 'dart:developer';

import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                  height: 48.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.teal,
                  ),
                  child: Center(
                    child: Icon(Icons.add, size: 23.r, color: Colors.white),
                  ),
                ),
              ),
            )
          : SizedBox(),
    );
  }
}
