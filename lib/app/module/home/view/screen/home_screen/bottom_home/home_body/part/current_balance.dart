import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../Global_widget/custom_text.dart';

class CurrentBalance extends StatelessWidget {
  const CurrentBalance({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: 72.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.teal.shade50,
      ),
      child: Center(
        child: Column(
          spacing: 3.h,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(text: "current_balance".tr, fontsize: 14.sp),
            Obx(() {
              double currentBalance = 0.00;
              if (controller.userAllData.value.income != null ||
                  controller.userAllData.value.expense != null) {
                currentBalance = double.parse(
                  "${(controller.userAllData.value.income! - controller.userAllData.value.expense!)}",
                );
              }
              return CustomText(
                text: "\$$currentBalance",
                fontsize: 20.sp,
                fontWeight: FontWeight.bold,
              );
            }),
          ],
        ),
      ),
    );
  }
}
