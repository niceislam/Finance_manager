import 'package:finance_management/app/data/dummy_data/English_month.dart';
import 'package:finance_management/app/data/model/firebase_get_model.dart';
import 'package:finance_management/app/data/model/monthlyConvert_model.dart';

class FilterDataMonthly {
  Future<List<MonthlyConvertModel>> filterData({
    required List<TExpense> listData,
  }) async {
    List<MonthlyConvertModel> data = <MonthlyConvertModel>[];
    if (listData.isNotEmpty) {
      for (var i in EnglishMonth().months) {
        List<TExpense> monthlyData = listData
            .where((v) => v.dateTime?.split(" ")[1] == i)
            .toList();
        if (monthlyData.isNotEmpty) {
          int total = 0;
          for (var j in monthlyData) {
            total += j.cost ?? 0;
          }

          data.add(
            MonthlyConvertModel(
              monthName: "$i ${listData[0].dateTime!.split(" ")[2]}",
              totalCost: total,
              monthlyData: monthlyData
                  .map(
                    (v) => MonthlyData(
                      dateTime: v.dateTime,
                      costType: v.costType,
                      product: v.product,
                      cost: v.cost,
                    ),
                  )
                  .toList(),
            ),
          );
        }
      }
    } else {
      return [];
    }
    return data;
  }
}
