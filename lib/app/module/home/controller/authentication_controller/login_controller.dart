import 'dart:developer';

import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/module/home/view/screen/authentication_screen/login_body/login_body.dart';
import 'package:finance_management/app/module/home/view/screen/authentication_screen/register_body/register_body.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final mykey = GlobalKey<FormState>();
  RxInt signIndex = 0.obs;
  RxBool visibility = true.obs;
  RxBool isLoading = false.obs;
  TextEditingController emailControllerlogin = TextEditingController();
  TextEditingController passwordControllerlogin = TextEditingController();
  RxList newUserPage = [LoginAuth(), RegisterAuth()].obs;

  visibilityButton() {
    visibility.value = !visibility.value;
  }

  loginTap() async {
    if (mykey.currentState!.validate()) {
      isLoading.value = true;
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: emailControllerlogin.text,
              password: passwordControllerlogin.text,
            );
        if (userCredential.additionalUserInfo!.isNewUser == false) {
          EasyLoading.showSuccess("Login Successfully");
          await LocalStorage().writeData(
            key: "login",
            value: "${userCredential.user!.uid}",
          );
          Get.to(HomeScreen());
          emailControllerlogin.clear();
          passwordControllerlogin.clear();
        }
      } on FirebaseAuthException catch (error) {
        if (error.code == "invalid-credential") {
          EasyLoading.showError("Invalid Credential");
        }
      }
      isLoading.value = false;
    }
  }
}
