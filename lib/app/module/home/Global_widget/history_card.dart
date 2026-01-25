import 'package:flutter/material.dart';

import 'custom_text.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    this.icon,
    this.title,
    this.subTitle,
    this.actionTk,
    this.actionWid,
  });
  final Icon? icon;
  final String? title;
  final String? subTitle;
  final dynamic actionTk;
  final Widget? actionWid;

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
          text: "${title ?? ""}",
          fontWeight: FontWeight.w600,
          fontsize: 15,
        ),
        subtitle: CustomText(
          text: "${subTitle ?? ""}",
          fontsize: 13,
          textColor: Colors.grey,
        ),
        trailing:
            actionWid ??
            CustomText(
              text: "${double.parse("${actionTk ?? 0.00}")}",
              fontWeight: FontWeight.w600,
              fontsize: 15,
              textColor: Colors.red,
            ),
      ),
    );
  }
}
