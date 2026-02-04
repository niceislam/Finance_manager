import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Global_widget/custom_text.dart';

class Onbording_frame extends StatelessWidget {
  const Onbording_frame({
    super.key,
    this.image,
    this.title,
    this.body,
    this.widget,
  });
  final String? image;
  final String? title;
  final String? body;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //top image
            Column(
              children: [
                Image.asset(
                  height: 65.h,
                  width: 65.w,
                  "assets/image/splash.png",
                ),
                CustomText(
                  text: "Your Personal Finance Assistant",
                  fontsize: 13.sp,
                ),
              ],
            ),
            SizedBox(height: 20.h),

            //onbording center image
            Image.asset(
              fit: BoxFit.fill,
              height: 280.h,
              width: 310.w,
              "$image",
            ),
            SizedBox(height: 10.h),

            //title and body text
            SizedBox(height: 40.h),
            Column(
              spacing: 10.h,
              children: [
                CustomText(
                  text: "$title",
                  fontsize: 22.sp,
                  fontWeight: FontWeight.w900,
                ),
                SizedBox(
                  width: 300.w,
                  child: CustomText(
                    textAlign: TextAlign.center,
                    text: "$body",
                    fontsize: 16.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            widget ?? SizedBox(),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
