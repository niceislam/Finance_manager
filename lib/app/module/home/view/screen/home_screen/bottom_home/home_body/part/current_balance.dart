import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../Global_widget/custom_text.dart';

class CurrentBalance extends StatelessWidget {
  const CurrentBalance({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: 90,
      width: size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color:Colors.teal.shade50,
      ),
      child: Center(
        child: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(text: "current_balance".tr),
            Obx(
              () => CustomText(
                text:
                    "\$${(controller.userAllData.value.income! - controller.userAllData.value.expense!) ?? 0.00}",
                fontsize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
