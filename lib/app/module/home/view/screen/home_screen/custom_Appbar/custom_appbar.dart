import 'package:finance_management/app/module/home/Global_widget/custom_appbar.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Global_widget/custom_text.dart';

class AllAppbar extends StatelessWidget {
  const AllAppbar({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int val = controller.bottomIndex.value;
      return val == 0
          ? CustomAppbar(centerText: "home_title".tr)
          : val == 1
          ? CustomAppbar(
              centerText: "Btm_Tr".tr,
              actionIcon: Icon(Icons.more_vert, color: Colors.white, size: 30),
            )
          : val == 2
          ? CustomAppbar(centerText: "Btm_Rp".tr)
          : SizedBox();
      // return AppBar(
      //   actions: [
      //     val == 1
      //         ? GestureDetector(
      //             onTap: () {},
      //             child: Icon(Icons.more_vert, color: Colors.white, size: 30),
      //           )
      //         : SizedBox(),
      //     SizedBox(width: 10),
      //   ],
      //   centerTitle: true,
      //   title: CustomText(
      //     text:
      //         "${val == 0
      //             ? "Overview"
      //             : val == 1
      //             ? "Transection"
      //             : "Report"}",
      //     textColor: Colors.white,
      //     fontsize: 22,
      //   ),
      //   backgroundColor: Colors.indigo,
      // );
    });
  }
}
