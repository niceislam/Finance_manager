import 'dart:convert';
import 'dart:developer';

import 'package:finance_management/app/data/model/firebase_get_model.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReportController extends GetxController {
  HomeController Hcontroller = Get.find<HomeController>();
  RxList<String> ReportDayCategory = ["All", "Today", "Weekly", "Monthly"].obs;
  RxList<String> ReportChartCategory = ["Pie Chart", "Bar Chart"].obs;
  RxString storeDayValue = "All".obs;
  RxString storeChartValue = "Pie Chart".obs;
  RxList<TExpense> barChartReport = <TExpense>[].obs;

  void categoryChecker()async{
    final fromData = Hcontroller.userAllData.value.allExpense;
    if (storeDayValue.value == "All") {
      List<TExpense>? data = Hcontroller.userAllData.value.allExpense;
      barChartReport.assignAll(data ?? []);
    } else if (storeDayValue.value == "Today") {
      List<TExpense>? data = Hcontroller.userAllData.value.tExpense;
      barChartReport.assignAll(data ?? []);
    } else if (storeDayValue.value == "Weekly") {
      if (fromData!.isNotEmpty) {
        List<TExpense> weeklyData = [];
        for (int i = 0; i < fromData.length; i += 7) {
          double sum = 0.00;
          for (
            int iData = i;
            iData < i + 7 && iData < fromData.length;
            iData++
          ) {
            sum = sum + fromData[iData].cost!.toDouble();
          }
          Map<String, Object> mapData = {
            "cost": sum.toInt(),
            "costType": "",
            "dateTime": "",
            "product": "${(i / 7).toInt() + 1}th week",
          };
          weeklyData.add(TExpense.fromJson(mapData));
        }
        barChartReport.assignAll(weeklyData);
      } else {
        barChartReport.assignAll([]);
      }
    } else if (storeDayValue.value == "Monthly") {
      barChartReport.assignAll([]);
    }
  }
}
