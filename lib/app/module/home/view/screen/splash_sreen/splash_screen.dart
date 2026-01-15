import 'dart:ui';

import 'package:finance_management/app/module/home/controller/splash_controller/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController controller = Get.put(SplashController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Obx(
          () => AnimatedContainer(
            height: controller.isSkip.value == true ? 400 : 350,
            width: controller.isSkip.value == true ? 390 : 350,
            duration: Duration(seconds: 3),
            child: Image.asset(fit: BoxFit.fill, "assets/image/splash.png"),
          ),
        ),
      ),
    );
  }
}
