import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/controller/authentication_controller/login_controller.dart';
import 'package:finance_management/app/module/home/view/screen/authentication_screen/login_body/part/login_button.dart';
import 'package:finance_management/app/module/home/view/screen/authentication_screen/login_body/part/social_login.dart';
import 'package:finance_management/app/module/home/view/screen/authentication_screen/login_body/part/textfield_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.teal.shade50,
              ),
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Welcome Back!",
                    fontWeight: FontWeight.bold,
                    fontsize: 20.sp,
                  ),
                  SizedBox(height: 2.h),
                  CustomText(
                    text: "Please enter your details to login.",
                    fontsize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 25.h),

                  //Login Textfields
                  TextfieldLogin(controller: controller),
                  SizedBox(height: 8.h),

                  //forgot password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(40),
                        onTap: () {},
                        child: CustomText(
                          text: "Forgot Password",
                          fontsize: 13.sp,
                          fontWeight: FontWeight.w600,
                          textColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.h),

            //login button
            LoginButton(controller: controller),
            SizedBox(height: 17.h),

            //Social login
            SocialLoginPart(),
            SizedBox(height: 40.h),
            Row(
              spacing: 3.w,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Don’t have an account?",
                  fontWeight: FontWeight.w400,
                  fontsize: 14.sp,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    controller.signIndex.value = 1;
                  },
                  child: CustomText(
                    text: "Register here",
                    fontsize: 14.sp,
                    fontWeight: FontWeight.w900,
                    textColor: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 17.h),
          ],
        ),
      ),
    );
  }
}
