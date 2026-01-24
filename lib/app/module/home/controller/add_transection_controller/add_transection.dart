import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTraController extends GetxController {
  PageController pageController = PageController();
  TextEditingController productsControleller = TextEditingController();
  TextEditingController costPriceController = TextEditingController();
  TextEditingController incomeController = TextEditingController();
  RxString dateFormat = DateFormat("dd MMM yyy").format(DateTime.now()).obs;
  RxString TimeFormat = DateFormat("hh:mm").format(DateTime.now()).obs;
  final mykey = GlobalKey<FormState>();
  final mykeyincome = GlobalKey<FormState>();
  RxBool slideOnEnd = true.obs;
  RxBool IncomeLoading = false.obs;
  RxBool expenseLoading = false.obs;
  RxString costType = "".obs;

  expenseSave() async {
    log("============expense");
    expenseLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    expenseLoading.value = false;
    // if (mykey.currentState!.validate()) {
    //   log(
    //     "======${productsControleller.text}=====${costType}=======${costPriceController.text}",
    //   );
    // }
  }

  incomeSave() async {
    IncomeLoading.value = true;
    await LocalStorage().deleteAll();
    IncomeLoading.value = false;
  }
}
