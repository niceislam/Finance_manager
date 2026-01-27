import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/view/screen/authentication_screen/Auth_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportBody extends StatelessWidget {
  const ReportBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
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
              ElevatedButton(
                onPressed: () async {
                  await LocalStorage().deleteData(key: "login");
                  Get.off(() => AuthPage());
                },
                child: CustomText(text: "Log out"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
