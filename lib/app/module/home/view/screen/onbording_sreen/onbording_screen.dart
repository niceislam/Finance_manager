import 'dart:developer';
import 'package:get/get.dart';
import 'package:finance_management/app/core/utils/onbording_page/page.dart';
import 'package:finance_management/app/module/home/controller/onbording_controller/onbording.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnbordingController controller = Get.put(OnbordingController());
    return Scaffold(
      body: Obx(
        () => IntroductionScreen(
          isProgress: controller.onchangedPage.value == 2 ? false : true,
          dotsDecorator: DotsDecorator(
            color: Colors.grey,
            activeColor: Colors.teal,
            size: Size(7, 7),
            activeSize: Size(11, 11),
          ),
          onChange: (v) {
            controller.onchangedPage.value = v;
          },
          globalBackgroundColor: Colors.white,
          done: SizedBox(),
          showDoneButton: true,
          skip: SizedBox(),
          showSkipButton: true,
          onDone: () {
            controller.startButton();
          },
          showNextButton: true,
          next: SizedBox(),
          rawPages: OnBordingPage().Pages,
        ),
      ),
    );
  }
}
