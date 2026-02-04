import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    this.icon,
    this.title,
    this.subTitle,
    this.actionTk,
    this.actionWid,
    this.subTitle2,
    this.ShowTime,
  });
  final Icon? icon;
  final String? title;
  final String? subTitle;
  final String? subTitle2;
  final dynamic actionTk;
  final Widget? actionWid;
  final bool? ShowTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.teal.shade50,
      ),
      child: ListTile(
        dense: true,
        leading: icon ?? Icon(Icons.close),
        title: CustomText(
          maxline: 1,
          text: title ?? "",
          fontWeight: FontWeight.w600,
          fontsize: 14.sp,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: subTitle ?? "",
              fontsize: 12.sp,
              textColor: Colors.grey,
            ),
            ShowTime == true
                ? CustomText(
                    text: subTitle2 ?? "",
                    fontsize: 12.sp,
                    textColor: Colors.grey,
                  )
                : SizedBox(),
          ],
        ),
        trailing:
            actionWid ??
            CustomText(
              text: "${double.parse("${actionTk ?? 0}")}",
              fontWeight: FontWeight.w600,
              fontsize: 13.5.sp,
              textColor: Colors.red,
            ),
      ),
    );
  }
}
