import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/module/home/view/screen/authentication_screen/Auth_main.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/home_screen.dart';
import 'package:finance_management/app/module/home/view/screen/onbording_sreen/onbording_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  RxBool isSkip = false.obs;

  Future<void> splashFun() async {
    var onbordingStatus = await LocalStorage().readData(key: "onbording");
    var loginStatus = await LocalStorage().readData(key: "login");
    await Future.delayed(Duration(milliseconds: 50));
    isSkip.value = true;
    await Future.delayed(Duration(milliseconds: 1800));
    if (onbordingStatus != null) {
      if (loginStatus != null) {
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
