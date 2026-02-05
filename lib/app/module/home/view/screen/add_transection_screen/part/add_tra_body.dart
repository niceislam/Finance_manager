import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Global_widget/category_slider/CategorySlideBtn.dart';
import '../../../../Global_widget/custom_text.dart';
import '../../../../controller/add_transection_controller/add_transection.dart';
import 'expense_textfield.dart';
import 'income_textfield.dart';

class AddTraBody extends StatelessWidget {
  const AddTraBody({super.key, required this.size, required this.controller});

  final Size size;
  final AddTraController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(top: 20, left: 15, right: 15),
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
        color: Colors.white,
      ),
      child: Column(
        spacing: 8.h,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //slide button
          CategorySlideButton(
            size: size,
            leftTitle: "home_expense_view".tr,
            rightTitle: "home_income_view".tr,
            controller: controller,
            control1: () {
              controller.slideOnEnd.value = false;
            },
            control2: () {
              controller.slideOnEnd.value = true;
            },
          ),

          //body
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    width: 350.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                    ),
                    child: Obx(
                      () => controller.slideOnEnd.value == false
                          ? ExpenseTexField(controller: controller)
                          : IncomeTexField(controller: controller),
                    ),
                  ),
                  SizedBox(height: 18.h),

                  //Submit Button
                  SizedBox(
                    height: 37.h,
                    width: 280.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(15),
                        ),
                      ),
                      onPressed: () {
                        controller.slideOnEnd.value == false
                            ? controller.expenseSave()
                            : controller.incomeSave();
                      },
                      child: Obx(
                        () =>
                            controller.IncomeLoading.value == true ||
                                controller.expenseLoading.value == true
                            ? Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.transparent,
                                  color: Colors.white,
                                ),
                              )
                            : CustomText(
                                text: "Add_Tr_Submit".tr,
                                textColor: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontsize: 16.sp,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
