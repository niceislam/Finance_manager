import 'package:finance_management/app/module/home/view/screen/add_transection_screen/add_transection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controller/drawer_controller/drawer_controller.dart';
import '../../widget/language_slide.dart';
import 'custom_listTile.dart';

class ServiceItemList extends StatelessWidget {
  const ServiceItemList({super.key, required this.controller});

  final AppDrawerController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        spacing: 7,
        children: [
          CustomListTile(
            title: "home_title".tr,
            Tileno: 1,
            selectedindex: controller.selectedIndex.value,
            leadingIcon: Icons.home,
            ontap: () {
              controller.selectedIndex.value = 1;
              Get.back();
            },
          ),
          CustomListTile(
            title: "Tr_title".tr,
            Tileno: 2,
            selectedindex: controller.selectedIndex.value,
            leadingIcon: Icons.view_list,
            ontap: () {
              controller.selectedIndex.value = 2;
              Get.back();
              controller.homeController.bottomIndex.value = 1;
            },
          ),
          CustomListTile(
            title: "Btm_Rp".tr,
            Tileno: 3,
            selectedindex: controller.selectedIndex.value,
            leadingIcon: Icons.bar_chart,
            ontap: () {
              controller.selectedIndex.value = 3;
              Get.back();
              controller.homeController.bottomIndex.value = 2;
            },
          ),
          CustomListTile(
            title: "drawer_Budget".tr,
            Tileno: 4,
            selectedindex: controller.selectedIndex.value,
            leadingIcon: Icons.wallet,
            ontap: () {
              controller.selectedIndex.value = 4;
              Get.to(() => AddTransection(), arguments: true);
            },
          ),
          CustomListTile(
            title: "Drawer_privacy".tr,
            Tileno: 5,
            selectedindex: controller.selectedIndex.value,
            leadingIcon: Icons.privacy_tip,
            ontap: () {
              controller.selectedIndex.value = 5;
            },
          ),
          Divider(),
          CustomListTile(
            title: "drawer_settings".tr,
            Tileno: 6,
            selectedindex: controller.selectedIndex.value,
            leadingIcon: Icons.settings,
            ontap: () {
              controller.selectedIndex.value = 6;
            },
          ),
          CustomListTile(
            title: "drawer_language".tr,
            selectedindex: controller.selectedIndex.value,
            leadingIcon: Icons.language,
            trailing: LanguageSlide(controller: controller.homeController),
          ),
          Divider(),
          CustomListTile(
            titleColor: Colors.red,
            iconColor: Colors.red,
            selectColor: Colors.red.shade50,
            title: "drawer_logOut".tr,
            Tileno: 7,
            selectedindex: controller.selectedIndex.value,
            leadingIcon: Icons.power_settings_new,
            ontap: () {
              controller.selectedIndex.value = 7;
            },
          ),
        ],
      ),
    );
  }
}
