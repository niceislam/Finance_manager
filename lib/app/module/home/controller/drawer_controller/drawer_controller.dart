import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:get/get.dart';

class AppDrawerController extends GetxController{
  final HomeController homeController  = Get.find<HomeController>();

  RxInt selectedIndex = 0.obs;
}