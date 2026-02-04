import 'package:finance_management/app/module/home/controller/add_transection_controller/add_transection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../Global_widget/custom_Textfield.dart';
import '../../../../Global_widget/custom_text.dart';

class IncomeTexField extends StatelessWidget {
  const IncomeTexField({super.key, required this.controller});
  final AddTraController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.mykeyincome,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildContainer(
                  child: CustomText(text: controller.dateFormat.value),
                ),
                _buildContainer(
                  child: CustomText(text: controller.TimeFormat.value),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          CustomText(
            text: "Add_Tr_Income".tr,
            fontWeight: FontWeight.w600,
            fontsize: 14.5.sp,
          ),
          CustomTextField(
            validator: (value) {
              if (value == "" || value == null) {
                return "field can't be empty";
              }
            },
            preIcon: Icon(Icons.account_balance),
            keyboardType: TextInputType.number,
            controller: controller.incomeController,
            hintText: "Add_Tr_Income_field".tr,
          ),
        ],
      ),
    );
  }

  Container _buildContainer({required Widget child}) {
    return Container(
      height: 40.h,
      width: 130.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(10),
        color: Colors.teal.shade100,
      ),
      child: Center(child: child),
    );
  }
}
