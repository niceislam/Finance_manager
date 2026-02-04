import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/drawer_item/part/edit_bio/part/image_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../Global_widget/custom_Textfield.dart';
import '../../../../../../Global_widget/custom_text.dart';

class EditBiodataDialogue extends StatelessWidget {
  const EditBiodataDialogue({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(5),
      ),
      title: Center(
        child: CustomText(
          text: "updateInfo_title".tr,
          fontsize: 18.5.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Column(
        spacing: 8.h,
        mainAxisSize: MainAxisSize.min,
        children: [
          //Add Image
          AddImage(controller: controller),
          SizedBox(height: 9.h),

          //Other TextField
          CustomTextField(
            hintText: "Name",
            controller: controller.nameEditController,
          ),
          CustomTextField(
            hintText: "Profession",
            controller: controller.professionEditController,
          ),
          CustomTextField(
            keyboardType: TextInputType.number,
            hintText: "Age",
            controller: controller.ageEditController,
          ),
          SizedBox(height: 8.h),
          Obx(
            () => controller.updateInfoLoading.value == true
                ? CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                    color: Colors.teal,
                  )
                : SizedBox(
                    height: 33.h,
                    width: 138.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10),
                        ),
                        backgroundColor: Colors.teal,
                      ),
                      onPressed: () {
                        controller.updateInfoButton();
                      },
                      child: CustomText(
                        text: "Update",
                        textColor: Colors.white,
                        fontsize: 15.sp,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
