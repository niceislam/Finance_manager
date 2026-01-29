import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/data/model/firebase_get_model.dart';
import 'package:finance_management/app/data/service/add_transection/get_all_data.dart';
import 'package:finance_management/app/data/service/add_transection/update_bioData.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_Textfield.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/view/screen/add_transection_screen/add_transection.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/widget/login_dialogue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../view/screen/home_screen/bottom_home/home_body/home_body.dart';
import '../../view/screen/home_screen/bottom_home/home_body/part/edit_bio.dart';
import '../../view/screen/home_screen/bottom_home/report_body/report_body.dart';
import '../../view/screen/home_screen/bottom_home/transection_body/transection_body.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation<Offset> offsetAnimation;
  RxInt bottomIndex = 0.obs;
  ScrollController scrollController = ScrollController();
  RxBool scrollToSlide = false.obs;
  RxBool languageSlide = false.obs;
  RxList bottomPage = [home_body(), TransectionBody(), ReportBody()].obs;
  Rx<FirebaseGetModel> userAllData = FirebaseGetModel().obs;
  TextEditingController nameEditController = TextEditingController();
  TextEditingController professionEditController = TextEditingController();
  TextEditingController ageEditController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool updateInfoLoading = false.obs;

  Future<void> floatingTap() async {
    var status = await LocalStorage().readData(key: "login");
    if (status != null) {
      Get.to(() => AddTransection())!.then((v) => getAllData());
    } else {
      Get.dialog(LoginDialogue());
    }
  }

  void homeScroll() {
    scrollController.addListener(() {
      if (scrollController.offset > 100) {
        scrollToSlide.value = true;
      } else {
        scrollToSlide.value = false;
      }
    });
  }

  void floatingSlide() {
    animController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 6000),
    );

    offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0, 0.4),
    ).animate(CurvedAnimation(parent: animController, curve: Curves.easeInOut));
    animController.repeat(reverse: true);
  }

  Future<void> getAllData() async {
    isLoading.value = true;
    dynamic uid = await LocalStorage().readData(key: "login");
    userAllData.value = await GetUserData().GetData(uid: uid);
    isLoading.value = false;
  }

  void updateInfo({required dynamic item}) {
    Get.dialog(
      EditBiodataDialogue(controller: Get.find<HomeController>()),
      transitionCurve: Curves.easeInOut,
    );
    nameEditController.text = item.name!;
    professionEditController.text = item.profession!;
    ageEditController.text = item.age!.toString();
  }

  void updateInfoButton() async {
    updateInfoLoading.value = true;
    await UpdateBiodata()
        .update(
          namecontroller: nameEditController,
          professionController: professionEditController,
          ageController: ageEditController,
        )
        .then((v) => getAllData());
    Get.back();
    updateInfoLoading.value = false;
  }

  void localeCheck() async {
    var status = await LocalStorage().readData(key: "language");
    if (status == "B") {
      languageSlide.value = true;
    } else {
      languageSlide.value = false;
    }
  }

  @override
  void onInit() {
    localeCheck();
    getAllData();
    floatingSlide();
    homeScroll();
    super.onInit();
  }

  @override
  void onClose() {
    animController.dispose();
    super.onClose();
  }
}
