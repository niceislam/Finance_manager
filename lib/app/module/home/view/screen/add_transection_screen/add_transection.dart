import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_appbar.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/controller/add_transection_controller/add_transection.dart';
import 'package:finance_management/app/module/home/view/screen/add_transection_screen/part/add_tra_body.dart';
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

                  //body
                  AddTraBody(size: size, controller: controller),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
