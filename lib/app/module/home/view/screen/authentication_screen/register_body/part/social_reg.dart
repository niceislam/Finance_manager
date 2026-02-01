import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import '../../widget/orLogin.dart';

class SocialRegister extends StatelessWidget {
  const SocialRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Or",
              style: TextStyle(
                color: Color(0xff222222),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        OrLogin(
          ontap: () async {
            await Fluttertoast.showToast(msg: "Upcoming...");
          },
          image: "assets/image/google.png",
          title: "Sign up with google",
        ),
        SizedBox(height: 15),
        OrLogin(
          ontap: () async {
            await Fluttertoast.showToast(msg: "Upcoming...");
          },
          image: "assets/image/facebook.png",
          title: "Sign up with facebook",
        ),
      ],
    );
  }
}
