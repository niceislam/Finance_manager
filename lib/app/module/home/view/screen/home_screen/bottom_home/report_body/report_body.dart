import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:finance_management/app/module/home/controller/report_controller/report.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ReportBody extends StatelessWidget {
  const ReportBody({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            child: ExpansionTile(
              shape: Border(),
              expansionAnimationStyle: AnimationStyle(curve: Curves.easeOutBack),
              title: CustomText(text: "Nice"),
              iconColor: Colors.red,
              dense: true,
              maintainState: false,
              backgroundColor: Colors.white,
              expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
              children: [Container(height: 200, width: 300, color: Colors.red)],
            ),
          ),

          SizedBox(height: 40),
        ],
      ),
    );
  }
}
