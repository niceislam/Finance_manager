import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../local/secure_storage/secure_storage.dart';

class IncomeAddFirebase {
  Future addData({required TextEditingController incomeController}) async {
    try {
      var uid = await LocalStorage().readData(key: "login");
      var calRef = FirebaseFirestore.instance.collection("users").doc(uid);
      calRef.update({"income": int.parse(incomeController.text)});
      return true;
    } catch (error) {
      log("=====Error:$error");
    }
  }
}
