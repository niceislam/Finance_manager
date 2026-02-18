import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RegisterService {
  Future reg({
    required TextEditingController emailController,
    required TextEditingController passController,
    required TextEditingController nameController,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passController.text,
          );
      if (userCredential.additionalUserInfo!.isNewUser == true) {
        String uid = userCredential.user!.uid;
        await FirebaseFirestore.instance.collection("users").doc(uid).set({
          "name": nameController.text.toString(),
          "profession": "Example",
          "age": 0,
          "income": 0,
          "expense": 0,
          "tExpense": [],
          "allExpense": [],
        });
        return true;
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == "email-already-in-use") {
        return false;
      }
    }
  }
}
