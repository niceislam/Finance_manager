import 'package:finance_management/app/module/home/view/screen/authentication_screen/Auth_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Global_widget/custom_text.dart';

class LoginDialogue extends StatelessWidget {
  const LoginDialogue({
    super.key,
    this.body,
    required this.yesButton,
    this.yesTitlle,
    this.titleWidget, this.icon,
  });
  final String? body;
  final String? yesTitlle;
  final VoidCallback yesButton;
  final Widget? titleWidget;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: titleWidget,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(5),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Icon(
              icon ?? Icons.login_outlined,
              size: 70,
              color: Colors.teal,
            ),
          ),
          SizedBox(height: 10),
          CustomText(
            text: body ?? "Please Login Again",
            textColor: Colors.black,
            fontsize: 17,
            fontWeight: FontWeight.w900,
          ),
          SizedBox(height: 20),
          DialogueButton(
            backColor: Colors.teal.shade100,
            title: yesTitlle ?? 'Login',
            ontap: yesButton,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {
              Get.back();
            },
            child: CustomText(
              text: "Cancel",
              fontWeight: FontWeight.w500,
              fontsize: 16,
              textColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox DialogueButton({
    required String title,
    required VoidCallback ontap,
    required Color backColor,
  }) {
    return SizedBox(
      height: 45,
      width: 230,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(5),
          ),
        ),
        onPressed: ontap,
        child: CustomText(
          text: "${title}",
          fontWeight: FontWeight.w600,
          fontsize: 18,
        ),
      ),
    );
  }
}
