import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/app/data/model/firebase_get_model.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/widget/login_dialogue.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

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
          log("======Data ${data}");
          return FirebaseGetModel.fromJson(data);
        } else {
          EasyLoading.showInfo("Something went wrong");
        }
      } else {
        Get.dialog(LoginDialogue());
      }
    } catch (error) {
      log("====Error:${error}");
    }
  }
}
