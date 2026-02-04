import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    this.centerText,
    this.leadingIcon,
    this.actionIcon,
    this.leadingTap,
    this.actionTap,
  });
  final String? centerText;
  final Widget? leadingIcon;
  final Widget? actionIcon;
  final VoidCallback? leadingTap;
  final VoidCallback? actionTap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.teal,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: GestureDetector(
          onTap: leadingTap,
          child: leadingIcon ?? SizedBox(),
        ),
      ),
      centerTitle: true,
      title: Text(
        centerText ?? "",
        style: TextStyle(
          color: Colors.white,
          fontSize: 17.sp,
          fontFamily: "myFont",
        ),
      ),
      actions: [
        GestureDetector(onTap: actionTap, child: actionIcon ?? SizedBox()),
        SizedBox(width: 10.w),
      ],
    );
  }
}
