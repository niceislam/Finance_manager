import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:flutter/material.dart';

class OrLogin extends StatelessWidget {
  const OrLogin({super.key, this.title, this.image, this.ontap});
  final String? title;
  final String? image;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: ontap,
      child: Container(
        height: 52,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xff0000001A).withAlpha(10),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffF4A7580F).withAlpha(10),
        ),
        child: Center(
          child: Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(height: 18, width: 18, "${image}"),
              CustomText(
                text: "${title}",
                fontWeight: FontWeight.w500,
                fontsize: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
