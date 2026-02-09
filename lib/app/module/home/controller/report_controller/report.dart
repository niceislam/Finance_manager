import 'package:finance_management/app/data/model/firebase_get_model.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  HomeController Hcontroller = Get.find<HomeController>();
  RxList<String> ReportDayCategory = ["All", "Today", "Weekly", "Monthly"].obs;
  RxList<String> ReportChartCategory = ["Pie Chart", "Bar Chart"].obs;
  RxString storeDayValue = "All".obs;
  RxString storeChartValue = "Pie Chart".obs;
  RxList<TExpense> barChartReport = <TExpense>[].obs;

  void BarChartControl({required String value}) {}
}
