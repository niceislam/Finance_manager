import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxBool isSlide = false.obs;

  void animationSlide() async {
    await Future.delayed(Duration(milliseconds: 100));
    isSlide.value = true;
  }

  @override
  void onInit() {
    animationSlide();
    super.onInit();
  }
}
