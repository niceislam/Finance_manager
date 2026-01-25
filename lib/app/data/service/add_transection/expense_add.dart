import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../local/secure_storage/secure_storage.dart';

class ExpenseAddFirebase {
  Future addData({
    required TextEditingController costPriceController,
    required TextEditingController productsControleller,
    required String costType,
    required String dateTime,
  }) async {
    try {
      var uid = await LocalStorage().readData(key: "login");
      var calRef = FirebaseFirestore.instance.collection("users").doc(uid);
      calRef.update({
        "tExpense": FieldValue.arrayUnion([
          {
            "cost": int.parse(costPriceController.text),
            "costType": "${costType}",
            "dateTime": "${dateTime}",
            "product": "${productsControleller.text}",
          },
        ]),
      });
      await EasyLoading.showSuccess("Expense Added");
    } catch (error) {
      log("======Error:${error}");
    }
  }
}
