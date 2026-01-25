import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportBody extends StatelessWidget {
  const ReportBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Row(
            spacing: 20,
            children: [
              Text("Add_Tr_Type_Field_hint".tr),
              ElevatedButton(
                onPressed: () {
                  Get.updateLocale(Locale("en", "US"));
                },
                child: CustomText(text: "English"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.updateLocale(Locale("bn", "BD"));
                },
                child: CustomText(text: "Bangla"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
