import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/data/model/firebase_get_model.dart';

class TodaydataDelete {
  Future deleteService({required List<TExpense> list}) async {
    try {
      String uid = await LocalStorage().readData(key: "login");
      var callRef = FirebaseFirestore.instance.collection("users").doc(uid);
      if (list != <TExpense>[]) {
        int value = 0;
        for (var i in list) {
          value += i.cost!;
        }
        callRef.update({
          "tExpense": [],
          "expense": FieldValue.increment(-value),
        });
        return true;
      } else {
        return false;
      }
    } catch (error) {
      log("===Error:$error");
      return false;
    }
  }
}
