import 'package:finance_management/app/data/dummy_data/privacy_data.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_appbar.dart';
import 'package:finance_management/app/module/home/controller/privacy_controller/privacy_controller.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/privacy_policy/widget/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    PrivacyController controller = Get.put(PrivacyController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(49),
        child: CustomAppbar(
          centerText: "Drawer_privacy".tr,
          leadingIcon: Icon(Icons.arrow_back_ios, color: Colors.white),
          leadingTap: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: PrivacyData().privacyPolicyListEn.length,
                itemBuilder: (context, index) {
                  final item = PrivacyData().privacyPolicyListEn;
                  return ExpansionCardCustom(
                    title: item[index]['title'],
                    body: item[index]['body'],
                    index: index + 1,
                    controller: controller,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
