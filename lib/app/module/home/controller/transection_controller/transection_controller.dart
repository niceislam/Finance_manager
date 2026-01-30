import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TransectionController extends GetxController {
  TextEditingController searchController = TextEditingController();
  final homeController = Get.find<HomeController>();
  RxBool iconActive = false.obs;
  RxBool slideOnEnd = false.obs;

  searchClearTap() {
    if (searchController.text.isNotEmpty) {
      searchController.clear();
    }
  }

  onEndSlidebtn() {
    slideOnEnd.value = !slideOnEnd.value;
  }

  @override
  void onInit() {
    searchController.addListener(() {
      if (searchController.text.isNotEmpty) {
        iconActive.value = true;
      } else {
        iconActive.value = false;
      }
    });
    super.onInit();
  }
}
