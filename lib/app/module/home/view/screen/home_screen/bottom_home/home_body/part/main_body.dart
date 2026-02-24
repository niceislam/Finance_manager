import 'dart:developer';

import 'package:finance_management/app/data/dummy_data/iconData.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/bottom_home/home_body/part/percent_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../Global_widget/history_card.dart';
import '../../../drawer_item/part/edit_bio/edit_bio.dart';

class main_body extends StatelessWidget {
  const main_body({super.key, required this.controller});
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 65, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8.h,
          children: [
            //percent part
            Obx(() {
              final item = controller.userAllData.value;
              final itemExpense = item.expense ?? 0;
              final itemIncome = item.income ?? 0;
              return percent_part(
                size: size,
                name: item.name ?? "Example",
                profession: item.profession ?? "Example",
                age: item.age ?? 0,
                monthlyIncome: item.income ?? 0,
                expense: item.expense ?? 0,
                percent: double.parse(
                  "${itemExpense < itemIncome ? itemExpense / itemIncome : 1}",
                ),
              );
            }),

            //income and expense
            Obx(() {
              final item = controller.userAllData.value;
              return Row(
                children: [
                  _buildContainer(
                    title: 'home_income_view'.tr,
                    tk: item.income ?? 0,
                    conColor: Colors.teal.shade50,
                    textColor: Colors.teal,
                    size: size,
                  ),
                  _buildContainer(
                    title: 'home_expense_view'.tr,
                    tk: item.expense ?? 0,
                    conColor: Colors.red.shade50,
                    textColor: Colors.red,
                    size: size,
                  ),
                ],
              );
            }),

            //recent transaction
            SizedBox(height: 18.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "home_TrView".tr,
                  fontWeight: FontWeight.w600,
                  fontsize: 15.sp,
                ),
                Obx(
                  () => CustomText(
                    text:
                        "${controller.userAllData.value.tExpense?.length ?? 0}",
                    fontWeight: FontWeight.w900,
                    fontsize: 15.sp,
                    textColor: Colors.grey,
                  ),
                ),
              ],
            ),
            Obx(() {
              final item =
                  controller.userAllData.value.tExpense?.reversed.toList() ??
                  [];
              return item.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Center(
                        child: CustomText(
                          text: "No_data_today".tr,
                          fontsize: 13.sp,
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: item.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final items = item[index];
                        return HistoryCard(
                          icon: CustomIconData().data(ticket: items.costType),
                          title: items.product ?? "",
                          subTitle: items.costType ?? "N/A",
                          actionTk: items.cost,
                        );
                      },
                    );
            }),
          ],
        ),
      ),
    );
  }

  Expanded _buildContainer({
    required String title,
    int? tk,
    required Color conColor,
    required Color textColor,
    required Size size,
  }) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
          color: conColor,
        ),
        child: Row(
          spacing: 10.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              spacing: 2,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: title,
                  fontWeight: FontWeight.w600,
                  textColor: textColor,
                  fontsize: 13.sp,
                ),
                CustomText(
                  text: "\$${double.parse("$tk")}",
                  fontWeight: FontWeight.w600,
                  textColor: textColor,
                  fontsize: 13.sp,
                ),
              ],
            ),
            Icon(Icons.arrow_downward, size: 22.r, color: textColor),
          ],
        ),
      ),
    );
  }
}
