import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../../../Global_widget/CategorySlideBtn.dart';
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
    return Obx(
      () => CategorySlideButton(
        size: size,
        leftTitle: "All",
        rightTitle: "Today",
        onendText: Trcontroller.slideOnEnd.value,
        onEndbutton: () {
          Trcontroller.slideOnEnd.value = !Trcontroller.slideOnEnd.value;
        },
      ),
    );
  }
}
