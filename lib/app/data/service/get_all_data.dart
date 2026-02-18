import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/app/data/model/firebase_get_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class GetUserData {
  Future GetData({required dynamic uid}) async {
    try {
      if (uid != null) {
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection("users")
            .doc(uid)
            .get();
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;
          return FirebaseGetModel.fromJson(data);
        } else {
          EasyLoading.showInfo("Something went wrong");
        }
      }
    } catch (error) {
      log("====Error:$error");
    }
  }
}
