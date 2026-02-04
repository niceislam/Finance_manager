import 'dart:developer';

import 'package:finance_management/app/data/dummy_data/cost_type_data.dart';
import 'package:finance_management/app/data/dummy_data/iconData.dart';
import 'package:finance_management/app/module/home/controller/add_transection_controller/add_transection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Global_widget/custom_Textfield.dart';
import 'package:get/get.dart';

import '../../../../Global_widget/custom_text.dart';

class ExpenseTexField extends StatelessWidget {
  const ExpenseTexField({super.key, required this.controller});
  final AddTraController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.mykey,
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
          //Product
          CustomText(
            text: "Add_Tr_ProductField".tr,
            fontWeight: FontWeight.w600,
            fontsize: 14.5.sp,
          ),
          CustomTextField(
            controller: controller.productsControleller,
            hintText: "Add_Tr_ProductField_hint".tr,
          ),
          SizedBox(height: 9.h),

          //Type
          CustomText(
            text: "Add_Tr_Type_Field".tr,
            fontWeight: FontWeight.w600,
            fontsize: 14.5.sp,
          ),
          Obx(
            () => DropdownButtonFormField(
              padding: EdgeInsets.symmetric(horizontal: 10),
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(10),
              validator: (value) {
                if (value == null || value == "") {
                  return "field can't be empty";
                }
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              hint: CustomText(
                text: "Add_Tr_Type_Field_hint".tr,
                textColor: Colors.grey,
              ),
              initialValue: controller.costType.value != ""
                  ? controller.costType.value
                  : null,
              items: CostType().Type
                  .map(
                    (v) => DropdownMenuItem(
                      value: v,
                      child: Row(
                        spacing: 8,
                        children: [
                          CustomIconData().data(ticket: v),
                          CustomText(text: v),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                controller.costType.value = value!;
              },
            ),
          ),
          SizedBox(height: 10),

          //Cost price
          CustomText(
            text: "Add_Tr_Cost_Field".tr,
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
            controller: controller.costPriceController,
            hintText: "Add_Tr_Cost_Field_hint".tr,
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
