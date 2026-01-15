import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.text,
    this.fontsize,
    this.fontWeight,
    this.textOverflow,
    this.textDecoration,
    this.textColor,
     this.maxline,
    this.textAlign,
  });

  final String? text;
  final double? fontsize;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;
  final Color? textColor;
  final int? maxline;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      maxLines: maxline,
      "${text}",
      style: TextStyle(
        color: textColor ?? Colors.black,
        fontSize: fontsize ?? 16,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontFamily: "myFont",
        overflow: textOverflow,
        decoration: textDecoration,
      ),
    );
  }
}
