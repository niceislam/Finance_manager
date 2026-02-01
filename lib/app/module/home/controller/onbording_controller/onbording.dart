import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/module/home/view/screen/authentication_screen/Auth_main.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/home_screen.dart';
import 'package:get/get.dart';

class OnbordingController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt onchangedPage = 0.obs;

  Future<void> startButton() async {
    isLoading.value = true;
    await Future.delayed(Duration(milliseconds: 500));
    await LocalStorage().writeData(key: "onbording", value: "yes");
    Get.offAll(() => HomeScreen());
    // var status = await LocalStorage().readData(key: "login");
    // if (status != null) {
    //   Get.offAll(() => HomeScreen());
    // } else {
    //   Get.to(() => AuthPage());
    // }
    isLoading.value = false;
  }
}
