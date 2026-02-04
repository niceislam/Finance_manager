import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../Global_widget/custom_Textfield.dart';
import '../../../../../controller/authentication_controller/reg_controller.dart';

class RegTextfields extends StatelessWidget {
  const RegTextfields({super.key, required this.controller});

  final RegController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Name field
        RequiredRow(title: "Name"),
        SizedBox(height: 3.h),
        CustomTextField(
          validator: (value) {
            if (value == "" || value == null) {
              return "Field can't be empty";
            }
          },
          controller: controller.nameController,
          hintText: "Enter your Name",
        ),
        SizedBox(height: 18.h),

        //Email field
        RequiredRow(title: 'Email'),
        SizedBox(height: 3.h),
        CustomTextField(
          controller: controller.emailController,
          hintText: "Enter your email",
          validator: (value) {
            if (value == null || value == "") {
              return "Field can't be empty.";
            } else if (!(value.contains('@') && value.contains('.'))) {
              return "Enter a valid email";
            }
          },
        ),
        SizedBox(height: 18.h),

        //password field
        RequiredRow(title: 'Password'),
        SizedBox(height: 3.h),
        Obx(
          () => CustomTextField(
            validator: (value) {
              if (value == null || value == "") {
                return "field cat't be empty";
              } else if (!((RegExp("[a-z]").hasMatch(value)) &&
                  (RegExp("[A-Z]").hasMatch(value)) &&
                  (RegExp("[0-9]").hasMatch(value)))) {
                return "password must 'A-Z','a-z','0-9'";
              } else if (value.length <= 6) {
                return "Must be 8 character or over";
              }
            },
            controller: controller.passController,
            obsecureText: controller.visibility.value,
            hintText: "*************",
            sufIcon: InkWell(
              borderRadius: BorderRadius.circular(20),
              radius: 10.r,
              onTap: () {
                controller.passTap();
              },
              child: controller.visibility.value == false
                  ? Icon(
                      Icons.visibility_off_outlined,
                      color: Color(0xffD1D1D1),
                      size: 20.r,
                    )
                  : Icon(
                      Icons.visibility_outlined,
                      color: Color(0xffD1D1D1),
                      size: 20.r,
                    ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }

  Row RequiredRow({required String title}) {
    return Row(
      spacing: 2,
      children: [
        CustomText(text: title, fontWeight: FontWeight.w500, fontsize: 14.sp),
        Text(
          "*",
          style: TextStyle(color: Colors.red, fontSize: 14.sp),
        ),
      ],
    );
  }
}
