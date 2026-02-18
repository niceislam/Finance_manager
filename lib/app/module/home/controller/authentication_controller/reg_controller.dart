import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../data/service/register.dart';

class RegController extends GetxController {
  final mykey = GlobalKey<FormState>();
  RxBool visibility = false.obs;
  RxBool isLoading = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  passTap() {
    visibility.value = !visibility.value;
  }

  register() async {
    if (mykey.currentState!.validate()) {
      isLoading.value = true;
      bool status = await RegisterService().reg(
        emailController: emailController,
        passController: passController,
        nameController: nameController,
      );
      if (status) {
        EasyLoading.showSuccess("you are registered");
        emailController.clear();
        nameController.clear();
        passController.clear();
      } else {
        EasyLoading.showError("This email has been taken");
      }
      isLoading.value = false;
    }
  }
}
