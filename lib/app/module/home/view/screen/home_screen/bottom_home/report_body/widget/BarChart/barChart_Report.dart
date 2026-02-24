import 'dart:developer';

import 'package:finance_management/app/module/home/controller/report_controller/report.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../Global_widget/custom_text.dart';

class BarchartReport extends StatelessWidget {
  const BarchartReport({super.key, required this.controller});
  final ReportController controller;

  @override
  Widget build(BuildContext context) {
    if (controller.barChartReport.isNotEmpty) {
      return BarChart(
        duration: Duration(seconds: 1),
        BarChartData(
          groupsSpace: 5,
          titlesData: FlTitlesData(
            rightTitles: AxisTitles(),
            topTitles: AxisTitles(),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
              axisNameSize: 25.h,
              axisNameWidget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _bottomWidget(title: "Expense", conColor: Colors.teal),
                ],
              ),
            ),
          ),

          alignment: BarChartAlignment.start,
          gridData: FlGridData(show: false),
          backgroundColor: Colors.grey.shade100,
          barGroups: controller.barChartReport.asMap().entries.map((v) {
            int index = v.key;
            var value = v.value;
            return _BarChartGroupData(
              costValue: double.parse("${value.cost}"),
              xvalue: index,
            );
          }).toList(),
          borderData: FlBorderData(
            border: Border.all(color: Colors.grey.shade200),
          ),
        ),
      );
    }
    return Center(child: CustomText(text: "No_data_found".tr,fontsize: 13.sp,));
  }

  Row _bottomWidget({required String title, required Color conColor}) {
    return Row(
      spacing: 3,
      children: [
        Container(
          height: 11.h,
          width: 12.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: conColor,
          ),
        ),
        CustomText(text: title, fontsize: 13.sp),
      ],
    );
  }

  BarChartGroupData _BarChartGroupData({
    required double costValue,
    required int xvalue,
  }) {
    return BarChartGroupData(
      x: xvalue,
      barRods: [
        BarChartRodData(
          width: 8.w,
          toY: costValue,
          color: Colors.teal,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(3),
            topRight: Radius.circular(3),
          ),
        ),
      ],
    );
  }
}
