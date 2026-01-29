import 'dart:developer';

import 'package:flutter/material.dart';
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
    this.editInfo,
  });

  final Size size;
  final String? name;
  final String? profession;
  final int? age;
  final double? percent;
  final int? monthlyIncome;
  final int? expense;
  final VoidCallback? editInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 175,
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
        spacing: 15,
        children: [
          Expanded(
            flex: 8,
            child: CircularPercentIndicator(
              radius: 75.0,
              lineWidth: 12.0,
              percent: percent ?? 0.0,
              animation: true,
              animationDuration: 1000,
              center: Column(
                spacing: 3,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 110,
                    child: Center(
                      child: CustomText(
                        maxline: 1,
                        text: double.parse(
                          "${percent! * 100}",
                        ).toStringAsFixed(1),
                        fontsize: 30,
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
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        maxline: 1,
                        text: name != "" ? name : "N/A",
                        fontWeight: FontWeight.w600,
                        fontsize: 20,
                      ),
                      CustomText(
                        maxline: 1,
                        text: profession == "" ? "N/A" : profession,
                        fontsize: 15,
                        textColor: Colors.grey,
                      ),
                      CustomText(
                        text: "${age != "" ? age : "0"}",
                        textColor: Colors.grey,
                        fontsize: 15,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: InkWell(
                    onTap: editInfo,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey.shade100,
                      child: Center(
                        child: Icon(Icons.edit, size: 23, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
