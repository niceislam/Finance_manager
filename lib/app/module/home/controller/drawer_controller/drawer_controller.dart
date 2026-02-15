import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:get/get.dart';

class AppDrawerController extends GetxController {
  final HomeController homeController = Get.find<HomeController>();
  RxBool isSlide = false.obs;
  RxInt selectedIndex = 0.obs;

  Future<void> animationSlide() async {
    await Future.delayed(Duration(milliseconds: 80));
    isSlide.value = true;
  }

  @override
  void onInit() {
    animationSlide();
    super.onInit();
  }
}
