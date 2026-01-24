import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/controller/authentication_controller/login_controller.dart';
import 'package:finance_management/app/module/home/view/screen/authentication_screen/login_body/part/login_button.dart';
import 'package:finance_management/app/module/home/view/screen/authentication_screen/login_body/part/social_login.dart';
import 'package:finance_management/app/module/home/view/screen/authentication_screen/login_body/part/textfield_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Global_widget/custom_Textfield.dart';
import '../widget/orLogin.dart';

class LoginAuth extends StatelessWidget {
  const LoginAuth({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Form(
      key: controller.mykey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Welcome Back!",
              fontWeight: FontWeight.bold,
              fontsize: 22,
            ),
            SizedBox(height: 8),
            CustomText(
              text: "Please enter your details to login.",
              fontsize: 14,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 25),

            //Login Textfields
            TextfieldLogin(controller: controller),
            SizedBox(height: 10),

            //forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(40),
                  onTap: () {},
                  child: CustomText(
                    text: "Forgot Password",
                    fontsize: 14,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            //login button
            LoginButton(controller: controller),
            SizedBox(height: 20),

            //Social login
            SocialLoginPart(),
            SizedBox(height: 70),
            Row(
              spacing: 3,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Don’t have an account?",
                  fontWeight: FontWeight.w400,
                  fontsize: 16,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    controller.signIndex.value = 1;
                  },
                  child: CustomText(
                    text: "Register here",
                    fontsize: 16,
                    fontWeight: FontWeight.w900,
                    textColor: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

