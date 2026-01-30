import 'package:finance_management/app/module/home/controller/drawer_controller/drawer_controller.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/drawer_item/part/image_info_part.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/drawer_item/part/service_item_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDrawerItem extends StatelessWidget {
  const MainDrawerItem({super.key});

  @override
  Widget build(BuildContext context) {
    AppDrawerController controller = Get.put(AppDrawerController());
    return GestureDetector(
      onTap: () {
        controller.selectedIndex.value = 0;
      },
      child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
        width: 280,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 5),
          child: Column(
            spacing: 10,
            children: [
              ImageAndInfo(controller: controller),
              Divider(),
              ServiceItemList(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
