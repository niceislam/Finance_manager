import 'package:finance_management/app/module/home/controller/onbording_controller/onbording.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../../../module/home/Global_widget/custom_text.dart';
import '../../../module/home/view/screen/onbording_sreen/widget/onbording_frame.dart';

class OnBordingPage {
  List<Widget> Pages = [
    Onbording_frame(
      image: "assets/image/onbording 2.png",
      title: "Track Every Rupe",
      body:
          "Easily log your daily expenses & income to see where your money goes.",
    ),
    Onbording_frame(
      image: "assets/image/onbording 3.png",
      title: "Visualize Your Finance",
      body: "Get clear insights with beautiful charts and graphs",
    ),
    Onbording_frame(
      image: "assets/image/onbording 4.jpg",
      title: "Achieve Your Goals",
      body: "Save budget, save more, and take control your future",
      widget: GestureDetector(
        onTap: () {
          Get.put(OnbordingController()).startButton();
        },
        child: Container(
          height: 48,
          width: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.teal,
          ),
          child: Center(
            child: Obx(() {
              OnbordingController controller = Get.put(OnbordingController());
              return controller.isLoading.value == true
                  ? CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      color: Colors.teal,
                    )
                  : CustomText(
                      text: "Get Started",
                      fontsize: 20,
                      textColor: Colors.white,
                    );
            }),
          ),
        ),
      ),
    ),
  ];
}
