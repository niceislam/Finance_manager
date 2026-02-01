import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../Global_widget/custom_text.dart';
import '../../widget/orLogin.dart';

class SocialLoginPart extends StatelessWidget {
  const SocialLoginPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CustomText(
            text: "Or",
            fontsize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20),
        OrLogin(
          ontap: () async {
            await Fluttertoast.showToast(msg: "Upcoming...");
          },
          image: "assets/image/google.png",
          title: "Sign in with google",
        ),
        SizedBox(height: 15),
        OrLogin(
          ontap: () async {
            await Fluttertoast.showToast(msg: "Upcoming...");
          },
          image: "assets/image/facebook.png",
          title: "Sign in with facebook",
        ),
      ],
    );
  }
}
