import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  HomeController Hcontroller = Get.find<HomeController>();
  RxList<String> reportList = ["All", "Today", "Weekly", "Monthly"].obs;
  RxString initialValue = "All".obs;
}
