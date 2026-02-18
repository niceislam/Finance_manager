import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/data/model/firebase_get_model.dart';
import 'package:finance_management/app/data/service/todayData_delete.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/widget/custom_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../view/screen/home_screen/settings_screen/widget/delete_dialogue.dart';

class SettingsController extends GetxController {
  HomeController HController = Get.find<HomeController>();
  RxBool isSlide = false.obs;
  RxBool isLoading = false.obs;
  TextEditingController deleteAllController = TextEditingController();

  void animationSlide() async {
    await Future.delayed(Duration(milliseconds: 100));
    isSlide.value = true;
  }

  void deleteAllData() {
    Get.dialog(DeleteDialogue());
  }

  void deleteTodayData() {
    Get.dialog(
      CustomAlertDia(
        title: "Confirmation".tr,
        body: "delete_today_body".tr,
        yesOntap: () {
          deleteTodayConfirm();
        },
        noOntap: () {
          Get.back();
        },
      ),
    );
  }

  void deleteAllConfirm() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 1));
    if (deleteAllController.text == "delete") {
      EasyLoading.showSuccess("Delete Successfully");
    } else {
      EasyLoading.showError("Don't match");
    }
    isLoading.value = false;
  }

  Future<void> deleteTodayConfirm() async {
    await TodaydataDelete().deleteService(
      list: HomeController().userAllData.value.tExpense ?? [],
    );
  }

  @override
  void onInit() {
    animationSlide();
    super.onInit();
  }
}
