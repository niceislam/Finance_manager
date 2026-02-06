import 'package:finance_management/app/module/home/controller/splash_controller/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController controller = Get.put(SplashController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/image/splashpro.png",
              height: 150.h,
              width: 190.w,
              fit: BoxFit.fill,
            ),
            Obx(
              () => AnimatedContainer(
                curve: Curves.bounceOut,
                height: controller.isSkip.value == true ? 55.h : 55.h,
                width: controller.isSkip.value == true ? 230.w : 120.w,
                duration: Duration(milliseconds: 2500),
                child: Image.asset("assets/image/splashText.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
