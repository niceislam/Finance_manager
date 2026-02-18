import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/data/model/firebase_get_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class TodaydataDelete {
  Future<void> deleteService({required List<TExpense> list}) async {
    try {
      String uid = await LocalStorage().readData(key: "login");
      var callRef = FirebaseFirestore.instance.collection("users").doc(uid);
      if (list != <TExpense>[]) {
        int value = 0;
        for (var i in list) {
          value += i.cost ?? 0;
        }
        log("========DAta ${list[0].cost}");
      } else {
        EasyLoading.showError("Error");
      }
    } catch (error) {
      log("===Error:$error");
    }
  }
}
