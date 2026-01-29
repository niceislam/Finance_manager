import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../local/secure_storage/secure_storage.dart';

class UpdateBiodata {
  Future update({
    required TextEditingController namecontroller,
    required TextEditingController professionController,
    TextEditingController? ageController,
  }) async {
    try {
      var uid = await LocalStorage().readData(key: "login");
      DocumentReference callRef = FirebaseFirestore.instance
          .collection("users")
          .doc(uid);
      callRef.update({
        "name": namecontroller.text,
        "profession": professionController.text,
        "age": int.parse(
          "${ageController!.text == "" ? 0 : ageController.text}",
        ),
      });
      if (callRef.id != "") {
        EasyLoading.showSuccess("Data Updated");
      } else {
        EasyLoading.showError("Something wrong");
      }
    } catch (error) {
      log("========Error $error");
    }
  }
}
