import 'package:finance_management/app/data/service/filterData.dart';
import 'package:finance_management/app/data/model/firebase_get_model.dart';
import 'package:finance_management/app/data/model/monthlyConvert_model.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TransectionController extends GetxController {
  TextEditingController searchController = TextEditingController();
  final homeController = Get.find<HomeController>();
  Rx<FirebaseGetModel> userData = FirebaseGetModel().obs;
  RxBool iconActive = false.obs;
  RxBool slideOnEnd = false.obs;
  RxList<MonthlyConvertModel> monthlyData = <MonthlyConvertModel>[].obs;

  void searchClearTap() {
    if (searchController.text.isNotEmpty) {
      searchController.clear();
    }
  }

  void filterMonth() async {
    final source = homeController.userAllData.value.allExpense;
    if (source!.isNotEmpty) {
      List<MonthlyConvertModel> monthly = await FilterDataMonthly().filterData(
        listData: homeController.userAllData.value.allExpense ?? [],
      );
      monthlyData.assignAll(monthly);
    }
  }

  void onEndSlidebtn() {
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
    filterMonth();
    homeController.userAllData.listen((v) => filterMonth());
    super.onInit();
  }
}
