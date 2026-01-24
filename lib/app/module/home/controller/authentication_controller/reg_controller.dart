import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class RegController extends GetxController {
  final mykey = GlobalKey<FormState>();
  RxBool visibility = false.obs;
  RxBool isLoading = false.obs;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  passTap() {
    visibility.value = !visibility.value;
  }

  register() async {
    if (mykey.currentState!.validate()) {
      isLoading.value = true;
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailcontroller.text,
              password: passcontroller.text,
            );
        if (userCredential.additionalUserInfo!.isNewUser == true) {
          EasyLoading.showSuccess("you are registered");

          String uid = userCredential.user!.uid;
          await FirebaseFirestore.instance.collection("users").doc(uid).set({
            "name": "Example",
            "profession": "Example",
            "age": 00,
            "income": 0.00,
            "expense": 0.00,
            "tExpense": [
              // {
              //   "costType": "shopping",
              //   "product": "grocery",
              //   "cost": 400,
              //   "dateTime": "12:25",
              // },
              // {
              //   "costType": "shopping",
              //   "product": "grocery",
              //   "cost": 400,
              //   "dateTime": "12:25",
              // },
              // {
              //   "costType": "shopping",
              //   "product": "grocery",
              //   "cost": 400,
              //   "dateTime": "12:25",
              // },
            ],
          });

          emailcontroller.clear();
          namecontroller.clear();
          passcontroller.clear();
        }
      } on FirebaseAuthException catch (error) {
        if (error.code == "email-already-in-use") {
          EasyLoading.showError("This email has been taken");
        }
      }
      isLoading.value = false;
    }
  }
}
