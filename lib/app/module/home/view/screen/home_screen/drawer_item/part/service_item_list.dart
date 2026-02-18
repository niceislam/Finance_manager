import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:finance_management/app/module/home/view/screen/add_transection_screen/add_transection.dart';
import 'package:finance_management/app/module/home/view/screen/authentication_screen/Auth_main.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/settings_screen/settings_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../controller/drawer_controller/drawer_controller.dart';
import '../../privacy_policy/privacy_policy.dart';
import '../../widget/language_slide.dart';
import '../../widget/login_dialogue.dart';
import 'custom_listTile.dart';

class ServiceItemList extends StatelessWidget {
  const ServiceItemList({super.key, required this.controller});

  final AppDrawerController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        spacing: 2.h,
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
            controller: controller,
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
            controller: controller,
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
            controller: controller,
          ),
          CustomListTile(
            controller: controller,
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
            controller: controller,
            title: "Drawer_privacy".tr,
            Tileno: 5,
            selectedindex: controller.selectedIndex.value,
            leadingIcon: Icons.privacy_tip,
            ontap: () {
              controller.selectedIndex.value = 5;
              Get.to(() => PrivacyPolicy());
            },
          ),
          Divider(),
          CustomListTile(
            controller: controller,
            title: "drawer_settings".tr,
            Tileno: 6,
            selectedindex: controller.selectedIndex.value,
            leadingIcon: Icons.settings,
            ontap: () {
              controller.selectedIndex.value = 6;
              Get.to(() => SettingsUi())?.then((v) {
                return Get.find<HomeController>().getAllData();
              });
            },
          ),
          CustomListTile(
            controller: controller,
            title: "drawer_language".tr,
            selectedindex: controller.selectedIndex.value,
            leadingIcon: Icons.language,
            trailing: LanguageSlide(controller: controller.homeController),
          ),
          Divider(),
          CustomListTile(
            controller: controller,
            titleColor: Colors.red,
            iconColor: Colors.red,
            selectColor: Colors.red.shade50,
            title: "drawer_logOut".tr,
            Tileno: 7,
            selectedindex: controller.selectedIndex.value,
            leadingIcon: Icons.power_settings_new,
            ontap: () {
              controller.selectedIndex.value = 7;
              Get.dialog(
                LoginDialogue(
                  icon: Icons.logout_outlined,
                  yesButton: () async {
                    await LocalStorage().deleteData(key: "login");
                    Get.offAll(
                      () => AuthPage(),
                    )?.then((v) => controller.homeController.getAllData());
                  },
                  yesTitlle: "drawer_logOut".tr,
                  body: "logout_body".tr,
                  titleWidget: Center(
                    child: CustomText(
                      text: "Confirmation".tr,
                      fontWeight: FontWeight.w600,
                      fontsize: 22,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
