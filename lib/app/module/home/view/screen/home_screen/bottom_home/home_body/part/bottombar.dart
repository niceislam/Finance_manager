import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../controller/home_controller/home.dart';

class CustomBottombar extends StatelessWidget {
  const CustomBottombar({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        selectedIconTheme: IconThemeData(size: 30, color: Colors.teal),
        selectedItemColor: Colors.teal,
        unselectedLabelStyle: TextStyle(fontFamily: "myFont"),
        selectedLabelStyle: TextStyle(fontFamily: "myFont"),
        onTap: (v) {
          controller.bottomIndex.value = v;
        },
        currentIndex: controller.bottomIndex.value,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Btm_home".tr),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: "Btm_Tr".tr,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: "Btm_Rp".tr),
        ],
      ),
    );
  }
}
