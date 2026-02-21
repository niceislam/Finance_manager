import 'package:finance_management/app/data/model/firebase_get_model.dart';
import 'package:finance_management/app/data/model/monthlyConvert_model.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  HomeController Hcontroller = Get.find<HomeController>();
  RxList<String> ReportDayCategory = ["All", "Today", "Weekly", "Monthly"].obs;
  RxList<String> ReportChartCategory = ["Pie Chart", "Bar Chart"].obs;
  RxString storeDayValue = "All".obs;
  RxString storeChartValue = "Pie Chart".obs;
  RxList<TExpense> barChartReport = <TExpense>[].obs;
  RxList<MonthlyConvertModel> monthlyData = <MonthlyConvertModel>[].obs;

  void categoryChecker() async {
    final fromData = Hcontroller.userAllData.value.allExpense;
    if (storeDayValue.value == "All") {
      List<TExpense>? data = Hcontroller.userAllData.value.allExpense;
      barChartReport.assignAll(data ?? []);
    } else if (storeDayValue.value == "Today") {
      List<TExpense>? data = Hcontroller.userAllData.value.tExpense;
      barChartReport.assignAll(data ?? []);
    } else if (storeDayValue.value == "Weekly") {
    } else if (storeDayValue.value == "Monthly") {

    }
  }
}
