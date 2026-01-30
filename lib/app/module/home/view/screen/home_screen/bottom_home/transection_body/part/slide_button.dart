import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../../../Global_widget/category_slider/CategorySlideBtn.dart';
import '../../../../../../controller/transection_controller/transection_controller.dart';

class SlideButtoon extends StatelessWidget {
  const SlideButtoon({
    super.key,
    required this.size,
    required this.Trcontroller,
  });

  final Size size;
  final TransectionController Trcontroller;

  @override
  Widget build(BuildContext context) {
    return CategorySlideButton(
      size: size,
      leftTitle: "Tr_slideBtn_left".tr,
      rightTitle: "Tr_slideBtn_right".tr,
      controller: Trcontroller,
      control1: () {
        Trcontroller.slideOnEnd.value = false;
      },
      control2: () {
        Trcontroller.slideOnEnd.value = true;
      },
    );
  }
}
