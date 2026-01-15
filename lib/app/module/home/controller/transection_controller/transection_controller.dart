import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TransectionController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxBool iconActive = false.obs;
  RxBool CatagorySlide = false.obs;
  RxBool onEnd = false.obs;

  searchClearTap() {
    if (searchController.text.isNotEmpty) {
      searchController.clear();
    }
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
