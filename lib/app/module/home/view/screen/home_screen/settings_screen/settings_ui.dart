import 'package:finance_management/app/data/dummy_data/English_month.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/controller/settings_controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../Global_widget/custom_appbar.dart';
import '../drawer_item/part/custom_listTile.dart';

class SettingsUi extends StatelessWidget {
  const SettingsUi({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Scaffold(
      backgroundColor: Colors.white,
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
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              _buildAnimatedContainer(
                ontap: () {
                  controller.deleteTodayData();
                },
                context,
                controller: controller,
                index: 1,
                title: "Delete_Today".tr,
              ),
              _buildAnimatedContainer(
                context,
                controller: controller,
                index: 2,
                title: "Delete_Month".tr,
                expansionTile: true,
                expansionItem: [
                  SizedBox(height: 10.h),
                  ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: EnglishMonth().months.length,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => CustomListTile(
                          leadingIcon: Icons.calendar_month,
                          selectColor: Colors.teal,
                          iconColor: controller.selectedMonth.value == index
                              ? Colors.white
                              : Colors.teal,
                          titleColor: controller.selectedMonth.value == index
                              ? Colors.white
                              : Colors.black,
                          title: EnglishMonth().months[index],
                          selectedindex: index,
                          Tileno: controller.selectedMonth.value,
                          ontap: () {
                            controller.selectedMonth.value = index;
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.teal,
                      ),
                      onPressed: () {
                        controller.monthlyDelete();
                      },
                      child: Center(
                        child: CustomText(
                          text: "Delete".tr,
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
              _buildAnimatedContainer(
                ontap: () {
                  controller.deleteAllData();
                },
                context,
                controller: controller,
                index: 3,
                title: "Delete_all".tr,
              ),
            ],
          ),
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
    bool? expansionTile,
    List<Widget>? expansionItem,
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
          child: expansionTile == true
              ? ExpansionTile(
                  collapsedIconColor: Colors.red,
                  iconColor: Colors.red,
                  splashColor: Colors.teal,
                  dense: true,
                  minTileHeight: 40.h,
                  backgroundColor: Colors.teal.shade100,
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  collapsedBackgroundColor: Colors.teal.shade200,
                  title: Center(
                    child: CustomText(
                      text: title ?? "",
                      textColor: Colors.red,
                      fontsize: 14.sp,
                    ),
                  ),
                  children: expansionItem ?? [],
                )
              : Container(
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
