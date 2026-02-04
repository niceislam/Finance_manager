import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../custom_text.dart';
import 'package:get/get.dart';

class CategorySlideButton extends StatelessWidget {
  const CategorySlideButton({
    super.key,
    required this.size,
    this.leftTitle,
    this.rightTitle,
    this.control1,
    this.control2,
    this.controller,
  });
  final Size size;
  final String? leftTitle;
  final String? rightTitle;
  final dynamic controller;
  final VoidCallback? control1;
  final VoidCallback? control2;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        height: 40.h,
        width: 335.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.teal.shade50,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedAlign(
              alignment: controller.slideOnEnd.value == true
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              duration: Duration(milliseconds: 200),
              child: Container(
                height: 33.h,
                width: 163.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.teal,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: control1,
                    child: Container(
                      color: Colors.transparent,
                      child: Center(
                        child: CustomText(
                          text: leftTitle ?? "",
                          textColor: Colors.black,
                          fontsize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: control2,
                    child: Container(
                      color: Colors.transparent,
                      child: Center(
                        child: CustomText(
                          text: rightTitle ?? "",
                          textColor: Colors.black,
                          fontsize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
