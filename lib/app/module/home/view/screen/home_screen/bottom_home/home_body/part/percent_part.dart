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
  });

  final Size size;
  final String? name;
  final String? profession;
  final String? age;
  final double? percent;
  final double? monthlyIncome;
  final double? expense;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 175,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
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
              percent: double.parse("${(expense! / monthlyIncome!)}"),
              animation: true,
              animationDuration: 1000,
              center: Column(
                spacing: 3,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Monthly Spending",
                    fontsize: 12,
                    fontWeight: FontWeight.w900,
                  ),
                  SizedBox(
                    width: 110,
                    child: Center(
                      child: CustomText(
                        maxline: 1,
                        text: "${monthlyIncome ?? 0.00}/${expense ?? 0.00}",
                        fontsize: 11,
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
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    maxline: 1,
                    text: "${name ?? "N/A"}",
                    fontWeight: FontWeight.w600,
                    fontsize: 20,
                  ),
                  CustomText(
                    maxline: 1,
                    text: "${profession ?? "N/A"}",
                    fontsize: 15,
                    textColor: Colors.grey,
                  ),
                  CustomText(
                    text: "${age ?? "0"}",
                    textColor: Colors.grey,
                    fontsize: 15,
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
