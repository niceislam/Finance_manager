import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../local/secure_storage/secure_storage.dart';

class UpdateBiodata {
  Future update({
    required TextEditingController namecontroller,
    required TextEditingController professionController,
    TextEditingController? ageController,
    required String imageUrl,
  }) async {
    try {
      var uid = await LocalStorage().readData(key: "login");
      DocumentReference callRef = FirebaseFirestore.instance
          .collection("users")
          .doc(uid);

      Map<String, dynamic> UpdateData = {
        "name": namecontroller.text,
        "profession": professionController.text,
        "age": int.parse(
          "${ageController!.text == "" ? 0 : ageController.text}",
        ),
      };
      if (imageUrl != "") {
        await LocalStorage().writeData(key: "image", value: imageUrl);
      }
      await callRef.update(UpdateData);

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
