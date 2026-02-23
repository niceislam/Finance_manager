import 'dart:developer';

import '../dummy_data/English_month.dart';

class DeleteMonthlydata {
  Future<void> delete(int selectedIndex) async {
    try {
      log("=======month ${EnglishMonth().months[selectedIndex]}");
    } catch (error) {
      log("==========Error:$error");
    }
  }
}
