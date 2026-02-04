import 'package:finance_management/app/module/home/controller/authentication_controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../Global_widget/custom_text.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.controller});

  final LoginController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.loginTap();
        },
        child: Container(
          height: 37.h,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.teal,
          ),
          child: controller.isLoading.value == true
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                    color: Colors.white,
                  ),
                )
              : Center(
                  child: CustomText(
                    text: "Login",
                    fontWeight: FontWeight.w600,
                    fontsize: 15.sp,
                    textColor: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
