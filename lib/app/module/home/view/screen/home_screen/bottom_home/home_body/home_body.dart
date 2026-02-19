import 'dart:developer';

import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/bottom_home/home_body/part/current_balance.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/bottom_home/home_body/part/main_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../core/utils/shimmer/home_shimmer.dart';

class home_body extends StatelessWidget {
  const home_body({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Obx(
      () => Stack(
        children: [
          SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 40),
                      height: 80.h,
                      width: MediaQuery.sizeOf(context).width,
                      color: Colors.teal,
                    ),

                    //home body
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      child: main_body(controller: controller),
                    ),

                    //current balance
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: CurrentBalance(controller: controller),
                    ),
                  ],
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            width: MediaQuery.sizeOf(context).width,
            top: controller.scrollToSlide.isTrue ? 5 : -100,
            duration: Duration(milliseconds: 100),
            child: CurrentBalance(controller: controller),
          ),
        ],
      )
    );
  }
}
