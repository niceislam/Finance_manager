import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.validator,
    this.sufIcon,
    this.obsecureText,
    this.keyboardType,
    this.inputFormatter,
    this.filled,
    this.focusedBorder,
    this.borderSide,
    this.fillColor,
    this.preIcon,
    this.onchanged,
    this.textAlign,
  });
  final String? hintText;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final InkWell? sufIcon;
  final bool? obsecureText;
  final bool? filled;
  final TextInputType? keyboardType;
  final TextInputFormatter? inputFormatter;
  final BorderSide? focusedBorder;
  final BorderSide? borderSide;
  final Color? fillColor;
  final Icon? preIcon;
  final ValueChanged? onchanged;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign ?? TextAlign.start,
      onChanged: onchanged,
      keyboardType: keyboardType,
      inputFormatters: [
        inputFormatter ?? FilteringTextInputFormatter.singleLineFormatter,
      ],
      obscureText: obsecureText ?? false,
      controller: controller,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      cursorColor: Colors.grey,
      cursorHeight: 23,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Color(0xffF4A758)),
        prefixIcon: preIcon,
        filled: filled,
        fillColor: fillColor,
        suffixIcon: sufIcon,
        hintText: "${hintText ?? ""}",
        hintStyle: TextStyle(
          color: Color(0xffC7C7C7),
          fontWeight: FontWeight.w500,
          fontFamily: "myFont",
          fontSize: 16,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: borderSide ?? BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: focusedBorder ?? BorderSide(color: Colors.grey),
        ),
      ),
      validator: validator,
    );
  }
}
