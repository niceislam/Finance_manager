import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../local/secure_storage/secure_storage.dart';

class LoginService {
  Future login({
    required TextEditingController emailControllerLogin,
    required TextEditingController passwordControllerLogin,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailControllerLogin.text,
            password: passwordControllerLogin.text,
          );
      if (userCredential.additionalUserInfo!.isNewUser == false) {
        await LocalStorage().writeData(
          key: "login",
          value: "${userCredential.user!.uid}",
        );
        return true;
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == "invalid-credential") {
        return false;
      }
    }
  }
}
