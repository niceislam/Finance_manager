import 'package:finance_management/app/data/model/firebase_get_model.dart';
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
    return BarChart(
      duration: Duration(seconds: 1),
      BarChartData(
        titlesData: FlTitlesData(
          rightTitles: AxisTitles(),
          topTitles: AxisTitles(),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, Titlemeta) {
                return CustomText(text: "d");
              },
            ),
            axisNameSize: 25.h,
            axisNameWidget: Row(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ),

        alignment: BarChartAlignment.start,
        gridData: FlGridData(show: false),
        backgroundColor: Colors.grey.shade100,
        barGroups: [
          _BarChartGroupData(incomeValue: 1000, costValue: 500, xvalue: 30),
          _BarChartGroupData(incomeValue: 300, costValue: 50, xvalue: 10),
        ],
        borderData: FlBorderData(
          border: Border.all(color: Colors.grey.shade200),
        ),
      ),
    );
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
    required double incomeValue,
    required double costValue,
    required int xvalue,
  }) {
    return BarChartGroupData(
      x: xvalue,
      barRods: [
        BarChartRodData(
          toY: incomeValue,
          color: Colors.teal,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(2),
            topRight: Radius.circular(2),
          ),
        ),
        BarChartRodData(
          toY: costValue,
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(3),
            topRight: Radius.circular(3),
          ),
        ),
      ],
    );
  }
}
