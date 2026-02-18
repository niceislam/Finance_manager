import 'package:finance_management/app/module/home/controller/settings_controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Global_widget/custom_Textfield.dart';
import '../../../../../Global_widget/custom_text.dart';
import 'package:get/get.dart';

class DeleteDialogue extends StatelessWidget {
  const DeleteDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Center(
        child: CustomText(
          text: "Confirmation".tr,
          fontsize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            text: "delete_all_body".tr,
            fontsize: 14,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomTextField(
              borderSide: BorderSide.none,
              filled: true,
              fillColor: Colors.grey.shade100,
              focusedBorder: BorderSide.none,
              hintText: "delete",
              textAlign: TextAlign.center,
              controller: controller.deleteAllController,
            ),
          ),
          Obx(
            () => controller.isLoading.value == true
                ? CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                    color: Colors.teal,
                  )
                : ElevatedButton(
                    onPressed: () {
                      controller.deleteAllConfirm();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      fixedSize: Size(130.w, 20.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: CustomText(
                        text: "Confirm".tr,
                        textColor: Colors.white,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
