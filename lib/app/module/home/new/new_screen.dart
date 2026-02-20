import 'dart:convert';
import 'dart:developer';
import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/new/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewController controller = Get.put(NewController());

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: CustomText(text: "Weekly Data", textColor: Colors.white),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Obx(() {
                log("==========${jsonEncode(controller.allData.value.allExpense)}");
                List monthlyData;
                monthlyData = controller.allData.value.allExpense!
                    .where(
                      (v) => v.dateTime.toString().substring(3, 6) == "Jan",
                    )
                    .toList();
                return CustomText(text: jsonEncode(monthlyData));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
