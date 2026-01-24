import 'dart:developer';

import 'package:finance_management/app/module/home/controller/transection_controller/transection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_text.dart';

class CategorySlideButton extends StatefulWidget {
  const CategorySlideButton({
    super.key,
    required this.size,
    this.leftTitle,
    this.rightTitle, this.onEndbutton, this.onendText,
  });

  final Size size;
  final String? leftTitle;
  final String? rightTitle;
  final VoidCallback? onEndbutton;
  final bool? onendText;

  @override
  State<CategorySlideButton> createState() => _CategorySlideButtonState();
}

class _CategorySlideButtonState extends State<CategorySlideButton> {
  bool CatagorySlide = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: 50,
      width: widget.size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.teal.shade50,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      CatagorySlide = false;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Center(
                      child: CustomText(text: "${widget.leftTitle ?? ""}"),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    CatagorySlide = true;
                    setState(() {});
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Center(
                      child: CustomText(text: "${widget.rightTitle ?? ""}"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          AnimatedPositioned(
            onEnd: widget.onEndbutton,
            left: CatagorySlide == true ? 188 : 0,
            duration: Duration(milliseconds: 150),
            child: Container(
              height: 40,
              width: 165,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.teal,
              ),
              child: Center(
                child: CustomText(
                  text:
                  "${widget.onendText == false ? "${widget.rightTitle ?? ""}" : "${widget.leftTitle ?? ""}"}",
                  textColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
