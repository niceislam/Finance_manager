import 'package:finance_management/app/data/dummy_data/report_page_color.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/controller/report_controller/report.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PieChartCustom extends StatelessWidget {
  const PieChartCustom({super.key, required this.controller});
  final ReportController controller;

  @override
  Widget build(BuildContext context) {
    if (controller.barChartReport.isNotEmpty) {
      return PieChart(
        PieChartData(
          titleSunbeamLayout: true,
          centerSpaceRadius: 0,
          sectionsSpace: 0,
          sections: List.generate(controller.barChartReport.length, (index) {
            double? percent;
            if (controller.barChartReport.isNotEmpty) {
              percent =
                  (controller.barChartReport[index].cost! /
                  controller.Hcontroller.userAllData.value.income!.toInt());
            }
            return PieChartSectionData(
              showTitle: true,
              title:
                  "${controller.storeDayValue.value == "Monthly" ? controller.barChartReport[index].product : percent}",
              titleStyle: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontFamily: "myFont",
              ),
              value: controller.barChartReport[index].cost?.toDouble() ?? 10,
              radius: 115.r,
              color: ReportPageColor()
                  .myColors[index % ReportPageColor().myColors.length],
            );
          }),
        ),
      );
    }
    return Center(child: CustomText(text: "No_data_found".tr,fontsize: 13.sp,));
  }
}
