import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/widget/custom_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'bottom_home/home_body/part/bottombar.dart';
import 'bottom_home/widget/floating_action.dart';
import 'custom_Appbar/custom_appbar.dart';
import 'drawer_item/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didpop, result) async {
          if (didpop) {
            return;
          }
          final souldpop = await showDialog(
            context: context,
            builder: (context) {
              return CustomAlertDia();
            },
          );
          if (souldpop == true) {
            SystemNavigator.pop();
          }
        },
        child: Scaffold(
          drawer: MainDrawerItem(),
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: AllAppbar(controller: controller),
          ),
          body: Obx(() => controller.bottomPage[controller.bottomIndex.value]),
          bottomNavigationBar: CustomBottombar(controller: controller),
          floatingActionButton: floating_action(controller: controller),
        ),
      ),
    );
  }
}
