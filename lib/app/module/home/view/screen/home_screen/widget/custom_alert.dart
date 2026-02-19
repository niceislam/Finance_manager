import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../Global_widget/custom_text.dart';

class CustomAlertDia extends StatelessWidget {
  const CustomAlertDia({
    super.key,
    this.title,
    this.body,
    required this.yesOntap,
    required this.noOntap,
  });
  final String? title;
  final String? body;
  final VoidCallback yesOntap;
  final VoidCallback noOntap;

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
        _buildElevatedButton(
          backColor: Colors.red,
          title: "yes".tr,
          ontap: yesOntap,
        ),
        _buildElevatedButton(
          backColor: Colors.green,
          title: "no".tr,
          ontap: noOntap,
        ),
      ],
    );
  }

  ElevatedButton _buildElevatedButton({
    required Color backColor,
    required String title,
    required VoidCallback ontap,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
      ),
      onPressed: ontap,
      child: CustomText(text: title, textColor: Colors.white),
    );
  }
}
