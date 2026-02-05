import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../data/local/secure_storage/secure_storage.dart';

class ReportController extends GetxController {
  RxMap mapgetData = {}.obs;
  Stream<DocumentSnapshot<Map<String, dynamic>>>? userStream;

  Future<void> initStream() async {
    String uid = await LocalStorage().readData(key: "login");
    userStream = FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .snapshots();
  }

  @override
  void onInit() {
    initStream();
    super.onInit();
  }
}
