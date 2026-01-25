import 'package:finance_management/app/data/service/add_transection/expense_add.dart';
import 'package:finance_management/app/data/service/add_transection/income_add.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTraController extends GetxController {
  PageController pageController = PageController();
  TextEditingController productsControleller = TextEditingController();
  TextEditingController costPriceController = TextEditingController();
  TextEditingController incomeController = TextEditingController();
  RxString dateFormat = DateFormat("dd MMM yyy").format(DateTime.now()).obs;
  RxString TimeFormat = DateFormat("hh:mm").format(DateTime.now()).obs;
  final mykey = GlobalKey<FormState>();
  final mykeyincome = GlobalKey<FormState>();
  RxBool slideOnEnd = true.obs;
  RxBool IncomeLoading = false.obs;
  RxBool expenseLoading = false.obs;
  RxString costType = "".obs;

  expenseSave() async {
    if (mykey.currentState!.validate()) {
      expenseLoading.value = true;
      await Future.delayed(Duration(seconds: 1));
      await ExpenseAddFirebase().addData(
        costPriceController: costPriceController,
        productsControleller: productsControleller,
        costType: costType.value,
        dateTime: "${dateFormat} ${TimeFormat}",
      );
      productsControleller.clear();
      costPriceController.clear();
      costType.value = "";
      expenseLoading.value = false;
    }
  }

  incomeSave() async {
    IncomeLoading.value = true;
    await Future.delayed(Duration(milliseconds: 500));
    await IncomeAddFirebase().addData(incomeController: incomeController);
    incomeController.clear();
    IncomeLoading.value = false;
  }
}
