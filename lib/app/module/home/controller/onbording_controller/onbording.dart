import 'dart:developer';

import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/home_screen.dart';
import 'package:get/get.dart';

class OnbordingController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt onchangedPage = 0.obs;

  startButton() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    await LocalStorage().writeData(key: "start", value: "yes");
    Get.offAll(() => HomeScreen());
    isLoading.value = false;
  }
}
