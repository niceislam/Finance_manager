import 'package:flutter/material.dart';
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
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.teal.shade50,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              left: controller.slideOnEnd.value == true ? 182 : 0,
              duration: Duration(milliseconds: 250),
              child: Container(
                height: 40,
                width: 170,
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
