import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../../../Global_widget/custom_text.dart';

class percent_part extends StatelessWidget {
  const percent_part({
    super.key,
    required this.size,
    this.name,
    this.profession,
    this.age,
    this.percent,
    this.monthlyIncome,
    this.expense,
  });

  final Size size;
  final String? name;
  final String? profession;
  final int? age;
  final double? percent;
  final int? monthlyIncome;
  final int? expense;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 128.h,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.teal.shade50,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 13.w,
        children: [
          Expanded(
            flex: 8,
            child: CircularPercentIndicator(
              radius: 60.r,
              lineWidth: 10.0,
              percent: percent ?? 0.0,
              animation: true,
              animationDuration: 700,
              center: Column(
                spacing: 3,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100.w,
                    child: Center(
                      child: CustomText(
                        maxline: 1,
                        text: double.parse(
                          "${percent! * 100}",
                        ).toStringAsFixed(1),
                        fontsize: 27.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              progressColor: Colors.red,
              backgroundColor: Colors.teal.shade300,
            ),
          ),
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    maxline: 1,
                    text: name != "" ? name : "N/A",
                    fontWeight: FontWeight.w600,
                    textOverflow: TextOverflow.ellipsis,
                    fontsize: 17.sp,
                  ),
                  CustomText(
                    maxline: 1,
                    text: profession == "" ? "N/A" : profession,
                    fontsize: 13.sp,
                    textColor: Colors.grey,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  CustomText(
                    text: "${age != "" ? age : "0"}",
                    textColor: Colors.grey,
                    fontsize: 13.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
