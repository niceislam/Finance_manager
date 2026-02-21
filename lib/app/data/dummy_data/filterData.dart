import 'dart:developer';

import 'package:finance_management/app/data/model/firebase_get_model.dart';
import 'package:finance_management/app/data/model/monthlyConvert_model.dart';

class FilterdataMonthly {
  Future<List<MonthlyConvertModel>> filterData({
    required List<TExpense> listData,
  }) async {
    List monthName = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    List<MonthlyConvertModel> data = <MonthlyConvertModel>[];
    if (listData.isNotEmpty) {
      for (var i in monthName) {
        List monthlyData = listData
            .where((v) => v.dateTime.toString().substring(3, 6) == i)
            .toList();
        if (monthlyData.isNotEmpty) {
          Map<String, dynamic> smallData = {
            "monthName": "$i",
            "monthlyData": monthlyData,
          };

          data.add(MonthlyConvertModel.fromJson(smallData));
          log("======monthly $data");
        }
      }
    } else {
      return [];
    }
    return data;
  }
}
