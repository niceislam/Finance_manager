import 'package:finance_management/app/module/home/controller/privacy_controller/privacy_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Global_widget/custom_text.dart';

class ExpansionCardCustom extends StatelessWidget {
  const ExpansionCardCustom({
    super.key,
    this.title,
    this.body,
    required this.index,
    required this.controller,
  });
  final String? title;
  final String? body;
  final int index;
  final PrivacyController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        margin: EdgeInsets.only(bottom: 10),
        transform: Matrix4.translationValues(
          controller.isSlide.isTrue ? 0 : 500,
          0,
          0,
        ),
        duration: Duration(milliseconds: 100 + (index * 200)),
        child: ExpansionTile(
          childrenPadding: EdgeInsets.all(10),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: Colors.teal.shade100,
          collapsedBackgroundColor: Colors.teal.shade100,
          dense: false,
          leading: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.teal,
            child: CustomText(text: "5", textColor: Colors.white),
          ),
          title: CustomText(text: "Nice Islam"),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          children: [
            CustomText(
              text: "ami akta nice amake keu chinen, ami kauke chinni na ",
            ),
          ],
        ),
      ),
    );
  }
}
