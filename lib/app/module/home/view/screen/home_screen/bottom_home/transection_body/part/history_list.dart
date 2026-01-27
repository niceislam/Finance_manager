import 'package:finance_management/app/data/dummy_data/iconData.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/controller/add_transection_controller/add_transection.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:finance_management/app/module/home/controller/transection_controller/transection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../Global_widget/history_card.dart';

class History_list extends StatelessWidget {
  const History_list({super.key, required this.controller});

  final TransectionController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Obx(() {
          final item = controller.homeController.userAllData.value;
          final status = !controller.slideOnEnd.value;
          return status
              ? item.tExpense!.isEmpty
                    ? Center(child: CustomText(text: "No_data".tr))
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: item.tExpense!.length,
                        itemBuilder: (context, index) {
                          return HistoryCard(
                            icon: CustomIconData().data(
                              ticket: item.tExpense![index].costType,
                            ),
                            title: item.tExpense![index].product,
                            subTitle: item.tExpense![index].costType,

                            actionTk: item.tExpense![index].cost,
                          );
                        },
                      )
              : item.allExpense!.isEmpty
              ? Center(child: CustomText(text: "No_data".tr))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: item.allExpense!.length,
                  itemBuilder: (context, index) {
                    return HistoryCard(
                      ShowTime: true,
                      subTitle2: item.allExpense![index].dateTime,
                      icon: CustomIconData().data(
                        ticket: item.allExpense![index].costType,
                      ),
                      title: item.allExpense![index].product,
                      subTitle: item.allExpense![index].costType,

                      actionTk: item.allExpense![index].cost,
                    );
                  },
                );
        }),
      ),
    );
  }
}
