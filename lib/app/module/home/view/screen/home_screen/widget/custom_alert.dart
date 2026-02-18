import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../Global_widget/custom_text.dart';

class CustomAlertDia extends StatelessWidget {
  const CustomAlertDia({
    super.key,
    this.title,
    this.body,
    this.yesOntap,
    this.noOntap,
  });
  final String? title;
  final String? body;
  final VoidCallback? yesOntap;
  final VoidCallback? noOntap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(5),
      ),
      title: Center(
        child: CustomText(
          text: title ?? "",
          fontsize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [CustomText(text: body ?? "", fontsize: 15.sp)],
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: yesOntap,
          child: CustomText(text: "yes".tr, textColor: Colors.white),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: noOntap,
          child: CustomText(text: "no".tr, textColor: Colors.white),
        ),
      ],
    );
  }
}
