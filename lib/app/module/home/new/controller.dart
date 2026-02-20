import 'dart:developer';

import 'package:finance_management/app/data/model/firebase_get_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewController extends GetxController {
  Rx<FirebaseGetModel> allData = FirebaseGetModel().obs;
  RxList monthly = [].obs;


  void filterData(){
    DateTime now = DateTime.now();
    List<TExpense> monthlyData = allData.value.allExpense!.where((v){
      DateTime dateTime = DateFormat("dd MMM yyyy").parse("${v.dateTime}");
    }).toList();
  }

  @override
  void onInit() {
    allData = Get.arguments;
    super.onInit();
  }
}
