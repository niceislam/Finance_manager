import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Global_widget/custom_Textfield.dart';
import '../../../../../Global_widget/custom_text.dart';
import '../../../../../controller/authentication_controller/login_controller.dart';

class TextfieldLogin extends StatelessWidget {
  const TextfieldLogin({
    super.key,
    required this.controller,
    required this.size,
  });

  final LoginController controller;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Email",
          fontWeight: FontWeight.w500,
          fontsize: size.flipped.aspectRatio * 7.5,
        ),
        SizedBox(height: 5),
        CustomTextField(
          controller: controller.emailControllerLogin,
          validator: (value) {
            if (value == "" || value == null) {
              return "Field can't be empty";
            } else if (!(value.contains('@') && value.contains('.'))) {
              return "Enter valid email";
            }
          },
          hintText: "Email",
        ),
        SizedBox(height: 23),
        CustomText(
          text: "Password",
          fontWeight: FontWeight.w500,
          fontsize: size.flipped.aspectRatio * 7.5,
        ),
        SizedBox(height: 5),
        Obx(
          () => CustomTextField(
            controller: controller.passwordControllerLogin,
            validator: (value) {
              if (value == "" || value == null) {
                return "Field can't be empty";
              } else if (!((RegExp("[a-z]").hasMatch(value)) &&
                  (RegExp("[A-Z]").hasMatch(value)) &&
                  (RegExp("[0-9]").hasMatch(value)))) {
                return "password must 'A-Z','a-z','0-9'";
              } else if (value.length <= 6) {
                return "Must be 8 character or over";
              }
            },
            obsecureText: controller.visibility.value,
            hintText: "*************",
            sufIcon: InkWell(
              borderRadius: BorderRadius.circular(20),
              radius: 10,
              onTap: () {
                controller.visibilityButton();
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
      ],
    );
  }
}
