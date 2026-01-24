import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/authentication_controller/reg_controller.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key, required this.controller});

  final RegController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.register();
        },
        child: Container(
          height: 52,
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
                    text: "Register",
                    fontsize: 18,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
