import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../../../Global_widget/custom_text.dart';

class percent_part extends StatelessWidget {
  const percent_part({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
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
      child: Center(
        child: CircularPercentIndicator(
          radius: 83.0,
          lineWidth: 12.0,
          percent: 0.35,
          animation: true,
          animationDuration: 1000,
          center: Column(
            spacing: 3,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "Monthly Spending",
                fontsize: 13,
                fontWeight: FontWeight.w600,
              ),
              CustomText(text: "\$20000.0/150", fontsize: 13),
            ],
          ),
          progressColor: Colors.red,
          backgroundColor: Colors.teal.shade300,
        ),
      ),
    );
  }
}
