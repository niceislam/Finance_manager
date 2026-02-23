import 'dart:developer';
import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/controller/authentication_controller/reg_controller.dart';
import 'package:finance_management/app/module/home/view/screen/authentication_screen/register_body/part/RegButton.dart';
import 'package:finance_management/app/module/home/view/screen/authentication_screen/register_body/part/Reg_Textfields.dart';
import 'package:finance_management/app/module/home/view/screen/authentication_screen/register_body/part/social_reg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../Global_widget/custom_Textfield.dart';
import '../../../../controller/authentication_controller/login_controller.dart';
import '../widget/orLogin.dart';

class RegisterAuth extends StatelessWidget {
  const RegisterAuth({super.key});

  @override
  Widget build(BuildContext context) {
    RegController controller = Get.put(RegController());
    LoginController controllerlogin = Get.put(LoginController());
    return Form(
      key: controller.mykey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 17.h),
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
                    text: "Let’s Get Started!",
                    fontWeight: FontWeight.bold,
                    fontsize: 20.sp,
                  ),
                  SizedBox(height: 2.h),
                  CustomText(
                    text: "Create an account.",
                    fontsize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 22.h),

                  //Register Textfields
                  RegTextfields(controller: controller),
                ],
              ),
            ),

            SizedBox(height: 30),

            //Register Button
            RegisterButton(controller: controller),
            SizedBox(height: 20),

            //Social Register
            SocialRegister(),
            SizedBox(height: 40),

            //have an account
            Row(
              spacing: 3,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Already have an account?",
                  fontWeight: FontWeight.w400,
                  fontsize: 14.w,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    controllerlogin.signIndex.value = 0;
                  },
                  child: CustomText(
                    text: "Login",
                    fontsize: 14.w,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
