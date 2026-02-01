import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:flutter/material.dart';
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
        Row(
          spacing: 2,
          children: [
            CustomText(text: "Name", fontWeight: FontWeight.w500, fontsize: 16),
            Text("*", style: TextStyle(color: Colors.red, fontSize: 16)),
          ],
        ),
        SizedBox(height: 5),
        CustomTextField(
          validator: (value) {
            if (value == "" || value == null) {
              return "Field can't be empty";
            }
          },
          controller: controller.nameController,
          hintText: "Enter your Name",
        ),
        SizedBox(height: 23),

        //Email field
        Row(
          spacing: 2,
          children: [
            CustomText(
              text: "Email",
              fontWeight: FontWeight.w500,
              fontsize: 16,
            ),
            Text("*", style: TextStyle(color: Colors.red, fontSize: 16)),
          ],
        ),
        SizedBox(height: 5),
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
        SizedBox(height: 23),

        //password field
        Row(
          spacing: 2,
          children: [
            CustomText(
              text: "Password",
              fontWeight: FontWeight.w500,
              fontsize: 16,
            ),
            Text("*", style: TextStyle(color: Colors.red, fontSize: 16)),
          ],
        ),
        SizedBox(height: 5),
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
              radius: 10,
              onTap: () {
                controller.passTap();
              },
              child: controller.visibility.value == true
                  ? Icon(
                      Icons.visibility_off_outlined,
                      color: Color(0xffD1D1D1),
                      size: 20,
                    )
                  : Icon(
                      Icons.visibility_outlined,
                      color: Color(0xffD1D1D1),
                      size: 20,
                    ),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
