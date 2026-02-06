import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:finance_management/app/module/home/controller/report_controller/report.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ReportBody extends StatelessWidget {
  const ReportBody({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
      child: Column(
        children: [
          // Obx(
          //   () => Center(child: CustomText(text: "${controller.streamData}")),
          // ),

          // Obx(
          //   () => Center(child: CustomText(text: "${controller.mapgetData}")),
          // ),
          // Container(
          //   height: 200,
          //   color: Colors.white,
          //   child: BarChart(
          //     BarChartData(
          //       minY: 10,
          //       maxY: 10000,
          //       alignment: BarChartAlignment.start,
          //
          //       backgroundColor: Colors.greenAccent.shade100,
          //       borderData: FlBorderData(show: false),
          //       gridData: FlGridData(show: false),
          //       titlesData: FlTitlesData(
          //         topTitles: AxisTitles(drawBelowEverything: false),
          //         rightTitles: AxisTitles(drawBelowEverything: false),
          //       ),
          //       barGroups: controller.userAllData.value.allExpense!.map((data) {
          //         return _BarChartData(
          //           x: data.cost!.toInt(),
          //           toY: double.parse("${data.cost}"),
          //           color: Colors.red,
          //         );
          //       }).toList(),
          //     ),
          //   ),
          // ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  BarChartGroupData _BarChartData({
    required int x,
    required double toY,
    required Color color,
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: toY,
          color: color,
          width: 16,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}
