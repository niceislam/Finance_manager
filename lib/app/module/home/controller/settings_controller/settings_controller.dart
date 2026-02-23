import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/app/data/dummy_data/English_month.dart';
import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/data/model/firebase_get_model.dart';
import 'package:finance_management/app/data/service/delete_all_data.dart';
import 'package:finance_management/app/data/service/todayData_delete.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/widget/custom_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../data/service/delete_monthlyData.dart';
import '../../view/screen/home_screen/settings_screen/widget/delete_dialogue.dart';

class SettingsController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  RxBool isSlide = false.obs;
  RxBool isLoading = false.obs;
  TextEditingController deleteAllController = TextEditingController();
  RxInt selectedMonth = 13.obs;

  void animationSlide() async {
    await Future.delayed(Duration(milliseconds: 100));
    isSlide.value = true;
  }

  void deleteAllData() {
    Get.dialog(DeleteDialogue());
  }

  void deleteMonthlyConfirm() {
    DeleteMonthlydata().delete(selectedMonth.value);
  }

  void monthlyDelete() {
    if (selectedMonth.value == 13) {
      EasyLoading.showError("Please select a month");
    } else {
      Get.dialog(
        CustomAlertDia(
          title: "Confirmation".tr,
          body: "delete_monthly_body".tr,
          yesOntap: () {
            deleteMonthlyConfirm();
          },
          noOntap: () {
            Get.back();
          },
        ),
      );
    }
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
      bool value = await DeleteAllData().allDelete();
      if (value) {
        EasyLoading.showSuccess("Delete Successfully");
        Get.back();
      } else {
        EasyLoading.showError("Something went wrong");
      }
    } else {
      EasyLoading.showError("Don't match");
    }
    isLoading.value = false;
  }

  void accountDelete() async {}

  Future<void> deleteTodayConfirm() async {
    bool value = await TodaydataDelete().deleteService(
      list: homeController.userAllData.value.tExpense ?? [],
    );
    if (value) {
      EasyLoading.showSuccess("Delete Successfully");
      Get.back();
    } else {
      EasyLoading.showError("Something went wrong");
    }
  }

  @override
  void onInit() {
    animationSlide();
    super.onInit();
  }
}
