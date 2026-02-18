import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/data/model/firebase_get_model.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/widget/login_dialogue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../data/service/get_all_data.dart';
import '../../../../data/service/update_bioData.dart';
import '../../view/screen/add_transection_screen/add_transection.dart';
import '../../view/screen/authentication_screen/Auth_main.dart';
import '../../view/screen/home_screen/bottom_home/home_body/home_body.dart';
import '../../view/screen/home_screen/drawer_item/part/edit_bio/edit_bio.dart';
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
  RxBool isLoading = true.obs;
  RxBool updateInfoLoading = false.obs;
  final ImagePicker picker = ImagePicker();
  RxString imagePath = "".obs;
  RxString showImage = "".obs;
  Stream<DocumentSnapshot<Map<String, dynamic>>>? userStream;

  void setStream() async {
    String uid = await LocalStorage().readData(key: "login");
    userStream = FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .snapshots();
  }

  void cameraImage() async {
    XFile? path = await picker.pickImage(source: ImageSource.camera);
    if (path != null) {
      imagePath.value = path.path;
    }
    Get.back();
  }

  void galleryImage() async {
    XFile? path = await picker.pickImage(source: ImageSource.gallery);
    if (path != null) {
      imagePath.value = path.path;
    }
    Get.back();
  }

  Future<void> floatingTap() async {
    var status = await LocalStorage().readData(key: "login");
    if (status != null) {
      Get.to(() => AddTransection())!.then((v) => getAllData());
    } else {
      Get.dialog(
        LoginDialogue(
          yesButton: () {
            Get.off(AuthPage());
          },
        ),
      );
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
    final imageData = await LocalStorage().readData(key: "image");
    isLoading.value = true;
    dynamic uid = await LocalStorage().readData(key: "login");
    userAllData.value = await GetUserData().GetData(uid: uid);
    if (imageData != null) {
      showImage.value = imageData;
    }
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

    bool status = await UpdateBiodata().update(
      namecontroller: nameEditController,
      professionController: professionEditController,
      ageController: ageEditController,
      imageUrl: '$imagePath',
    );

    if (status) {
      Get.back();
      getAllData();
      EasyLoading.showSuccess("Data Updated");
    } else {
      EasyLoading.showError("Something wrong");
    }

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

  void deleteTodayInfo() async {
    var TodayTime = DateTime.now().toString().split(" ")[0];
    var uid = await LocalStorage().readData(key: "login");
    var storeTime = await LocalStorage().readData(key: "time");

    if (storeTime != null) {
      if (storeTime != TodayTime) {
        var callRef = FirebaseFirestore.instance.collection("users").doc(uid);
        callRef.update({"tExpense": []});
        await LocalStorage().writeData(
          key: "time",
          value: DateTime.now().toString().split(" ")[0],
        );
      }
    } else {
      await LocalStorage().writeData(key: "time", value: TodayTime);
    }
  }

  void inintData() async {
    await getAllData();
    deleteTodayInfo();
  }

  @override
  void onInit() {
    setStream();
    inintData();
    localeCheck();
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
