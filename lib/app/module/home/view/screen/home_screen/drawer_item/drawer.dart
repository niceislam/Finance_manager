import 'package:finance_management/app/module/home/controller/drawer_controller/drawer_controller.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/drawer_item/part/image_info_part.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/drawer_item/part/service_item_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainDrawerItem extends StatelessWidget {
  const MainDrawerItem({super.key});

  @override
  Widget build(BuildContext context) {
    AppDrawerController controller = Get.put(AppDrawerController());
    return Container(
      width: 280.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          stops: [0, 0.4],
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [Colors.teal.shade200, Colors.white],
        ),
      ),
      child: GestureDetector(
        onTap: () {
          controller.selectedIndex.value = 0;
        },
        child: Drawer(
          backgroundColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 8),
            child: Column(
              spacing: 8.h,
              children: [
                ImageAndInfo(controller: controller),
                Divider(),
                ServiceItemList(controller: controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
