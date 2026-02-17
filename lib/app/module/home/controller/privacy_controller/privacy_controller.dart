import 'package:get/get.dart';

class PrivacyController extends GetxController {
  RxBool isSlide = false.obs;

  Future<void> privacySlide() async {
    await Future.delayed(Duration(milliseconds: 100));
    isSlide.value = true;
  }

  @override
  void onInit() {
    privacySlide();
    super.onInit();
  }
}
