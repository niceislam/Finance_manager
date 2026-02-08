import 'dart:convert';
import 'package:finance_management/app/data/model/firebase_get_model.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/controller/report_controller/report.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/bottom_home/report_body/widget/BarChart/barChart_Report.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/bottom_home/report_body/widget/report_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReportBody extends StatelessWidget {
  const ReportBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ReportController controller = Get.put(ReportController());
    return Column(
      children: [
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(height: 20.h, width: size.width, color: Colors.teal),

              //body
              Container(
                padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                margin: EdgeInsets.only(top: 5.h),
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  color: Colors.white,
                ),
                child: Obx(() {
                  final check = controller.Hcontroller.userAllData.value;
                  if (controller.storeDayValue.value == "All") {
                    List<TExpense>? data =
                        controller.Hcontroller.userAllData.value.allExpense;
                    controller.barChartReport.assignAll(data ?? []);
                  } else if (controller.storeDayValue.value == "Today") {
                    List<TExpense>? data =
                        controller.Hcontroller.userAllData.value.tExpense;
                    controller.barChartReport.assignAll(data ?? []);
                  }
                  if (check == FirebaseGetModel()) {
                    return Center(
                      child: CustomText(text: "Something went wrong"),
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Category Dropdown
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ReportDropdown(
                            dropValue: controller.storeDayValue.value == ""
                                ? null
                                : controller.storeDayValue.value,
                            itemList: controller.ReportDayCategory,
                            onchanged: (value) {
                              controller.storeDayValue.value = value;
                            },
                          ),
                          ReportDropdown(
                            dropValue: controller.storeChartValue.value == ""
                                ? null
                                : controller.storeChartValue.value,
                            itemList: controller.ReportChartCategory,
                            onchanged: (value) {
                              controller.storeChartValue.value = value;
                            },
                          ),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 10),

                      //PieChart
                      AspectRatio(
                        aspectRatio: 1.3.r,
                        child: BarchartReport(controller: controller),
                      ),

                      SizedBox(height: 20),
                      CustomText(text: jsonEncode(controller.barChartReport)),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
