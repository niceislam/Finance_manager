import 'package:finance_management/app/module/home/controller/drawer_controller/drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Global_widget/custom_text.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.title,
    this.leadingIcon,
    this.selectedindex,
    this.ontap,
    this.Tileno,
    this.titleColor,
    this.iconColor,
    this.selectColor,
    this.trailing,
  });
  final String? title;
  final IconData? leadingIcon;
  final int? selectedindex;
  final VoidCallback? ontap;
  final int? Tileno;
  final Color? titleColor;
  final Color? iconColor;
  final Color? selectColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Colors.black12,
      trailing: trailing,
      minTileHeight: 36.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      onTap: ontap,
      dense: false,
      leading: Icon(leadingIcon, color: iconColor ?? Colors.teal, size: 22.r),
      title: CustomText(
        text: title ?? "",
        fontWeight: FontWeight.w500,
        fontsize: 14.sp,
        textColor: titleColor ?? Colors.black,
      ),
      selected: true,
      selectedTileColor: Tileno == selectedindex
          ? selectColor ?? Colors.teal.shade50
          : Colors.transparent,
    );
  }
}
