import 'package:flutter/material.dart';

import '../../../../../../Global_widget/history_card.dart';

class History_list extends StatelessWidget {
  const History_list({
    super.key,
    this.title,
    this.icondata,
    this.subtitle,
    this.ActionWidget,
    this.actionTk,
    required this.itemcount,
  });
  final String? title;
  final IconData? icondata;
  final String? subtitle;
  final Widget? ActionWidget;
  final double? actionTk;
  final int itemcount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: itemcount,
          itemBuilder: (context, index) {
            return HistoryCard(
              icon: Icon(icondata),
              title: "${title ?? ""}",
              subTitle: "${subtitle ?? ""}",
              actionTk: 12,
              actionWid: ActionWidget,
            );
          },
        ),
      ),
    );
  }
}
