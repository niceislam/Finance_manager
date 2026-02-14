import 'package:finance_management/app/module/home/Global_widget/custom_appbar.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsUi extends StatelessWidget {
  const SettingsUi({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(49),
        child: CustomAppbar(
          leadingIcon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
          leadingTap: () {
            Get.back();
          },
          centerText: "Settings",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CouponCardCusotm(
              size: size,
              firstText: [
                CustomText(
                  text: "FLAT",
                  fontWeight: FontWeight.w900,
                  textColor: Colors.white,
                ),
                CustomText(
                  text: "50% off",
                  textColor: Colors.white,
                  fontsize: 18,
                  fontWeight: FontWeight.w900,
                ),
                CustomText(
                  text: "On your first order",
                  textColor: Colors.white,
                  fontsize: 13,
                ),
                CustomText(
                  text: "use coupon code to get OFFER",
                  textColor: Colors.white,
                  fontsize: 12,
                ),
              ],
              scndText: [
                CustomText(text: "code", textColor: Colors.white),
                CustomText(
                  text: "GETFIRST",
                  textColor: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontsize: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CouponCardCusotm extends StatelessWidget {
  const CouponCardCusotm({
    super.key,
    required this.size,
    this.firstText,
    this.scndText,
  });

  final Size size;
  final List<Widget>? firstText;
  final List<Widget>? scndText;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 1,
      children: [
        Flexible(
          flex: 10,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 13,
                  left: 40,
                  bottom: 13,
                  right: 20,
                ),
                height: 112,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  color: Colors.amber,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: firstText ?? [],
                ),
              ),
              CloseIconShow(top: 6, left: 6),
              CloseIconShow(top: 6, right: 6),
              CloseIconShow(bottom: 6, left: 6),
              CloseIconShow(bottom: 6, right: 6),

              WhiteCircle(top: -10, right: -10),
              WhiteCircle(bottom: -10, right: -10),
            ],
          ),
        ),
        Flexible(
          flex: 4,
          child: Stack(
            children: [
              Container(
                height: 112,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Colors.amber,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: scndText ?? [],
                ),
              ),
              CloseIconShow(top: 6, left: 6),
              CloseIconShow(top: 6, right: 6),
              CloseIconShow(bottom: 6, left: 6),
              CloseIconShow(bottom: 6, right: 6),
              WhiteCircle(top: -10, left: -10),
              WhiteCircle(bottom: -10, left: -10),
            ],
          ),
        ),
      ],
    );
  }

  Positioned WhiteCircle({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: CircleAvatar(radius: 10, backgroundColor: Colors.white),
    );
  }

  Positioned CloseIconShow({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Icon(Icons.close, color: Colors.white60, size: 22),
    );
  }
}
