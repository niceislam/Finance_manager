import 'package:finance_management/app/module/home/controller/report_controller/report.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PieChartCustom extends StatelessWidget {
  const PieChartCustom({super.key, required this.controller});
  final ReportController controller;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        centerSpaceRadius: 0,
        sectionsSpace: 0,
        sections: [
          PieChartSectionData(value: 70, radius: 115.r, color: Colors.red),
          PieChartSectionData(value: 100, radius: 115.r, color: Colors.teal),
        ],
      ),
    );
  }
}
