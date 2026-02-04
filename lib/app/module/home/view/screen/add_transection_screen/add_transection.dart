import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_appbar.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/controller/add_transection_controller/add_transection.dart';
import 'package:finance_management/app/module/home/view/screen/add_transection_screen/part/expense_textfield.dart';
import 'package:finance_management/app/module/home/view/screen/add_transection_screen/part/income_textfield.dart';
import 'package:finance_management/app/module/home/view/screen/authentication_screen/Auth_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Global_widget/category_slider/CategorySlideBtn.dart';

class AddTransection extends StatelessWidget {
  const AddTransection({super.key});

  @override
  Widget build(BuildContext context) {
    AddTraController controller = Get.put(AddTraController());
    Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(41.h),
          child: CustomAppbar(
            leadingTap: () {
              Get.back();
            },

            leadingIcon: Icon(Icons.arrow_back_ios, color: Colors.white),
            centerText: "Add_Tr_title".tr,
            actionTap: () {
              controller.slideOnEnd.value == false
                  ? controller.expenseSave()
                  : controller.incomeSave();
            },
            actionIcon: CustomText(
              text: "Add_Tr_Save".tr,
              textColor: Colors.white,
              fontsize: 14.sp,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    height: 50.h,
                    width: MediaQuery.sizeOf(context).width,
                    color: Colors.teal,
                  ),
                  Container(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //slide button
                        Center(
                          child: CategorySlideButton(
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
                        ),

                        //body
                        Center(
                          child: Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 20,
                                    ),
                                    width: 350.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey.shade200,
                                    ),
                                    child: Obx(
                                      () => controller.slideOnEnd.value == false
                                          ? ExpenseTexField(
                                              controller: controller,
                                            )
                                          : IncomeTexField(
                                              controller: controller,
                                            ),
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
                                          borderRadius:
                                              BorderRadiusGeometry.circular(15),
                                        ),
                                      ),
                                      onPressed: () {
                                        controller.slideOnEnd.value == false
                                            ? controller.expenseSave()
                                            : controller.incomeSave();
                                      },
                                      child: Obx(
                                        () =>
                                            controller.IncomeLoading.value ==
                                                    true ||
                                                controller
                                                        .expenseLoading
                                                        .value ==
                                                    true
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator(
                                                      backgroundColor:
                                                          Colors.transparent,
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
