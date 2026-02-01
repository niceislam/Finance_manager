import 'dart:developer';

import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/module/home/view/screen/authentication_screen/Auth_main.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/home_screen.dart';
import 'package:finance_management/app/module/home/view/screen/onbording_sreen/onbording_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  RxBool isSkip = false.obs;

  splashFun() async {
    var onbordingstatus = await LocalStorage().readData(key: "onbording");
    var loginstatus = await LocalStorage().readData(key: "login");
    await Future.delayed(Duration(milliseconds: 100));
    isSkip.value = true;
    await Future.delayed(Duration(milliseconds: 2500));
    if (onbordingstatus != null) {
      if (loginstatus != null) {
        Get.offAll(() => HomeScreen());
      } else {
        Get.offAll(() => AuthPage());
      }
    } else {
      Get.offAll(() => OnbordingScreen());
    }
  }

  @override
  void onInit() {
    splashFun();
    super.onInit();
  }
}
