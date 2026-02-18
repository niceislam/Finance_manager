import 'package:finance_management/app/module/home/view/screen/authentication_screen/login_body/login_body.dart';
import 'package:finance_management/app/module/home/view/screen/authentication_screen/register_body/register_body.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../data/service/login.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> mykey = GlobalKey<FormState>();
  RxInt signIndex = 0.obs;
  RxBool visibility = true.obs;
  RxBool isLoading = false.obs;
  TextEditingController emailControllerLogin = TextEditingController();
  TextEditingController passwordControllerLogin = TextEditingController();
  RxList newUserPage = [LoginAuth(), RegisterAuth()].obs;

  void visibilityButton() {
    visibility.value = !visibility.value;
  }

  Future<void> loginTap() async {
    if (mykey.currentState!.validate()) {
      isLoading.value = true;
      bool status = await LoginService().login(
        emailControllerLogin: emailControllerLogin,
        passwordControllerLogin: passwordControllerLogin,
      );
      if (status) {
        Get.to(() => HomeScreen());
        EasyLoading.showSuccess("Login Successfully");
        emailControllerLogin.clear();
        passwordControllerLogin.clear();
      } else {
        EasyLoading.showError("Invalid Credential");
      }
      isLoading.value = false;
    }
  }
}
