import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/controller/settings_controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../Global_widget/custom_appbar.dart';

class SettingsUi extends StatelessWidget {
  const SettingsUi({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: CustomAppbar(
          leadingIcon: Icon(Icons.arrow_back_ios, color: Colors.white),
          leadingTap: () {
            Get.back();
          },
          centerText: "drawer_settings".tr,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          spacing: 10,
          children: [
            _buildAnimatedContainer(
              ontap: () {
                controller.deleteAllData();
              },
              context,
              controller: controller,
              index: 1,
              title: "Delete_all".tr,
            ),
            _buildAnimatedContainer(
              ontap: () {
                controller.deleteTodayData();
              },
              context,
              controller: controller,
              index: 2,
              title: "Delete_Today".tr,
            ),
          ],
        ),
      ),
    );
  }

  Obx _buildAnimatedContainer(
    BuildContext context, {
    String? title,
    VoidCallback? ontap,
    required int index,
    required SettingsController controller,
  }) {
    return Obx(
      () => GestureDetector(
        onTap: ontap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300 + (index * 200)),
          curve: Curves.decelerate,
          transform: Matrix4.translationValues(
            controller.isSlide.isTrue ? 0 : 500,
            0,
            0,
          ),
          child: Container(
            height: 40.h,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: Offset(3, 5),
                  blurRadius: 5,
                  spreadRadius: 0,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              color: Colors.teal.shade200,
            ),
            child: Center(
              child: CustomText(
                text: title ?? "",
                textColor: Colors.red,
                fontsize: 14.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
