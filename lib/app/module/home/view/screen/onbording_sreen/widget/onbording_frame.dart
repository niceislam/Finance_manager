import 'package:flutter/material.dart';

import '../../../../Global_widget/custom_text.dart';

class Onbording_frame extends StatelessWidget {
  const Onbording_frame({
    super.key,
    this.image,
    this.title,
    this.body,
    this.widget,
  });
  final String? image;
  final String? title;
  final String? body;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      padding: EdgeInsets.only(top: 50),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //top image
            Column(
              children: [
                Image.asset(
                  height: size.height / 13.2,
                  width: size.width / 5.50,
                  "assets/image/splash.png",
                ),
                CustomText(
                  text: "Your Personal Finance Assistant",
                  fontsize: 13,
                ),
              ],
            ),
            SizedBox(height: 20),

            //onbording center image
            Image.asset(
              fit: BoxFit.fill,
              height: size.height * 0.4,
              width: size.width * 0.88,
              "$image",
            ),
            SizedBox(height: 10),

            //title and body text
            SizedBox(height: 80),
            Column(
              spacing: 10,
              children: [
                CustomText(
                  text: "$title",
                  fontsize: size.flipped.aspectRatio * 11,
                  fontWeight: FontWeight.w900,
                ),
                SizedBox(
                  width: 300,
                  child: CustomText(
                    textAlign: TextAlign.center,
                    text: "$body",
                    fontsize: size.flipped.aspectRatio * 8,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            widget ?? SizedBox(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
