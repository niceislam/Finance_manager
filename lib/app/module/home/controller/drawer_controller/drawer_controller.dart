import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:get/get.dart';

class AppDrawerController extends GetxController {
  final HomeController homeController = Get.find<HomeController>();
  RxBool isSlide = false.obs;
  RxInt selectedIndex = 0.obs;
  RxString profileImage = "".obs;


  Future<void> animationSlide() async {
    await Future.delayed(Duration(milliseconds: 80));
    isSlide.value = true;
  }

  void setPrImage() async {
    String? prImage = await LocalStorage().readData(key: "image");
    if (prImage != null) {
      profileImage.value = prImage;
    }
  }

  @override
  void onInit() {
    animationSlide();
    setPrImage();
    super.onInit();
  }
}
