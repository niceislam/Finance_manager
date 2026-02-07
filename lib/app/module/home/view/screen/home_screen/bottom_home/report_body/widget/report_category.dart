import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../Global_widget/custom_text.dart';
import '../../../../../../controller/report_controller/report.dart';

class ReportCategory extends StatelessWidget {
  const ReportCategory({super.key, required this.controller});

  final ReportController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: Container(
          height: 30.h,
          width: 100.w,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.shade100,
          ),
          child: Center(
            child: DropdownButton<String>(
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(10),
              underline: SizedBox(),
              isDense: true,

              value: controller.initialValue.value == ""
                  ? null
                  : controller.initialValue.value,
              items: controller.reportList.map<DropdownMenuItem<String>>((v) {
                return DropdownMenuItem(
                  value: v,
                  child: CustomText(text: v),
                );
              }).toList(),
              onChanged: (value) {
                controller.initialValue.value = value!;
              },
            ),
          ),
        ),
      ),
    );
  }
}
