import 'package:finance_management/app/module/home/Global_widget/custom_Textfield.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxBool isSlide = false.obs;
  TextEditingController deleteAllController = TextEditingController();

  void animationSlide() async {
    await Future.delayed(Duration(milliseconds: 100));
    isSlide.value = true;
  }

  void deleteAllData() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Center(child: CustomText(text: "Confirmation", fontsize: 20)),
        content: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: "Please type #delete to confirm delete",
              fontsize: 13,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(
                textAlign: TextAlign.center,
                controller: deleteAllController,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (deleteAllController.text == "delete") {
                  EasyLoading.showSuccess("Delete Successfully");
                } else {
                  EasyLoading.showError("error");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: CustomText(text: "Confirm", textColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  void deleteAllConfirm() {}

  void deleteTodayData() {}

  @override
  void onInit() {
    animationSlide();
    super.onInit();
  }
}
