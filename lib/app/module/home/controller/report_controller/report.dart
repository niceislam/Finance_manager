import 'package:finance_management/app/data/model/firebase_get_model.dart';
import 'package:finance_management/app/data/model/monthlyConvert_model.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:get/get.dart';
import '../../../../data/service/filterData.dart';

class ReportController extends GetxController {
  HomeController Hcontroller = Get.find<HomeController>();
  RxList<String> ReportDayCategory = ["All", "Today", "Monthly"].obs;
  RxList<String> ReportChartCategory = ["Pie Chart", "Bar Chart"].obs;
  RxString storeDayValue = "All".obs;
  RxString storeChartValue = "Pie Chart".obs;
  RxList<TExpense> barChartReport = <TExpense>[].obs;

  void categoryChecker() async {
    final fromData = Hcontroller.userAllData.value;
    if (storeDayValue.value == "All") {
      List<TExpense>? data = fromData.allExpense;
      barChartReport.assignAll(data ?? []);
    } else if (storeDayValue.value == "Today") {
      List<TExpense>? data = fromData.tExpense;
      barChartReport.assignAll(data ?? []);
    } else if (storeDayValue.value == "Monthly") {
      List<MonthlyConvertModel> monthlyExpanse = await FilterDataMonthly()
          .filterData(listData: fromData.allExpense ?? []);
      if (monthlyExpanse.isNotEmpty) {
        List<TExpense> data = [];
        for (var i in monthlyExpanse) {
          data.add(
            TExpense(
              cost: i.totalCost,
              product: "${i.monthName}",
              costType: "${i.totalCost}",
              dateTime: "${DateTime.now()}",
            ),
          );
        }
        barChartReport.assignAll(data);
      }
    }
  }

  @override
  void onInit() {
    categoryChecker();
    Hcontroller.userAllData.listen((v) => categoryChecker());
    storeDayValue.listen((v) {
      categoryChecker();
    });
    super.onInit();
  }
}
