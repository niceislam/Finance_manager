import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Global_widget/custom_text.dart';

class CustomAlertDia extends StatelessWidget {
  const CustomAlertDia({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(5),
      ),
      title: Center(
        child: CustomText(
          text: "Exit App",
          fontsize: 18.sp,
          fontWeight: FontWeight.w900,
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(text: "Are you sure to Exit this app?", fontsize: 15.sp),
        ],
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: CustomText(text: "Yes", textColor: Colors.white),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: CustomText(text: "No", textColor: Colors.white),
        ),
      ],
    );
  }
}
