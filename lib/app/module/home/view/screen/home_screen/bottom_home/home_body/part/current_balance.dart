import 'package:flutter/material.dart';

import '../../../../../../Global_widget/custom_text.dart';

class CurrentBalance extends StatelessWidget {
  const CurrentBalance({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: 90,
      width: size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(text: "Current Balance"),
            CustomText(
              text: "\$2500.2",
              fontsize: 25,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
