import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';

class DeleteAllData {
  Future allDelete() async {
    try {
      String uid = await LocalStorage().readData(key: "login");
      var callRef = FirebaseFirestore.instance.collection("users").doc(uid);
      callRef.update({
        "allExpense": [],
        "tExpense": [],
        "income": 0,
        "expense": 0,
      });
      return true;
    } catch (error) {
      log("=====Error:$error");
      return false;
    }
  }
}
