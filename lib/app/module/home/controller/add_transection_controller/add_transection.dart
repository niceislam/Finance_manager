import 'dart:developer';

import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/data/service/add_transection/expense_add.dart';
import 'package:finance_management/app/data/service/add_transection/income_add.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTraController extends GetxController {
  PageController pageController = PageController();
  TextEditingController productsControleller = TextEditingController();
  TextEditingController costPriceController = TextEditingController();
  TextEditingController incomeController = TextEditingController();
  RxString dateFormat = DateFormat("dd MMM yyy").format(DateTime.now()).obs;
  RxString TimeFormat = DateFormat("hh:mm aa").format(DateTime.now()).obs;
  final mykey = GlobalKey<FormState>();
  final mykeyincome = GlobalKey<FormState>();
  RxBool slideOnEnd = false.obs;
  RxBool IncomeLoading = false.obs;
  RxBool expenseLoading = false.obs;
  RxString costType = "".obs;

  Future<void> expenseSave() async {
    if (mykey.currentState!.validate()) {
      expenseLoading.value = true;
      await Future.delayed(Duration(seconds: 1));
      bool status = await ExpenseAddFirebase().addData(
        costPriceController: costPriceController,
        productsControleller: productsControleller,
        costType: costType.value,
        dateTime: "${dateFormat} ${TimeFormat}",
      );
      if (status) {
        EasyLoading.showSuccess("Expense Added");
        productsControleller.clear();
        costPriceController.clear();
        costType.value = "";
        expenseLoading.value = false;
      } else {
        EasyLoading.showError("something went wrong");
        expenseLoading.value = false;
      }
      expenseLoading.value = false;
    }
  }

  Future<void> incomeSave() async {
    if (mykeyincome.currentState!.validate()) {
      IncomeLoading.value = true;
      await Future.delayed(Duration(milliseconds: 500));
      bool status = await IncomeAddFirebase().addData(
        incomeController: incomeController,
      );
      if (status) {
        EasyLoading.showSuccess("Income Added");
        incomeController.clear();
        IncomeLoading.value = false;
      } else {
        EasyLoading.showError("something went wrong");
        IncomeLoading.value = false;
      }
      IncomeLoading.value = false;
    }
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      slideOnEnd.value = Get.arguments;
    }
    super.onInit();
  }
}
