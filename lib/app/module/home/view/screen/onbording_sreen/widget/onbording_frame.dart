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
    return Container(
      padding: EdgeInsets.only(top: 50),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          spacing: 40,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //top image
            Column(
              children: [
                Image.asset(
                  height: 65,
                  width: 65,
                  "assets/image/onbordingTop.png",
                ),
                CustomText(
                  text: "Your Personal Finance Assistant",
                  fontsize: 13,
                ),
              ],
            ),

            //onbording center image
            Image.asset(fit: BoxFit.fill, height: 340, width: 340, "${image}"),
            SizedBox(height: 10),

            //title and body text
            Column(
              spacing: 10,
              children: [
                CustomText(
                  text: "${title}",
                  fontsize: 28,
                  fontWeight: FontWeight.w900,
                ),
                SizedBox(
                  width: 300,
                  child: CustomText(
                    textAlign: TextAlign.center,
                    text: "${body}",
                    fontsize: 18,
                  ),
                ),
              ],
            ),
            widget ?? SizedBox(),
          ],
        ),
      ),
    );
  }
}
