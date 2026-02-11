import 'package:finance_management/app/data/dummy_data/iconData.dart';
import 'package:finance_management/app/data/model/firebase_get_model.dart';
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
      child: Obx(() {
        if (controller.homeController.userAllData.value != FirebaseGetModel()) {
          final item = controller.homeController.userAllData.value;
          final item2 = item.tExpense!.reversed.toList();
          final item3 = item.allExpense!.reversed.toList();
          return controller.slideOnEnd.value == true
              ? item2.isEmpty
                    ? Center(child: CustomText(text: "No_data_today".tr))
                    : Scrollbar(
                        thickness: 5,
                        radius: Radius.circular(20),
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          itemCount: item2.length,
                          itemBuilder: (context, index) {
                            return HistoryCard(
                              icon: CustomIconData().data(
                                ticket: item2[index].costType,
                              ),
                              title: item2[index].product,
                              subTitle: item2[index].costType,

                              actionTk: item2[index].cost,
                            );
                          },
                        ),
                      )
              : item3.isEmpty
              ? Center(child: CustomText(text: "No_data".tr))
              : Scrollbar(
                  thickness: 5,
                  radius: Radius.circular(20),
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    itemCount: item3.length,
                    itemBuilder: (context, index) {
                      return HistoryCard(
                        ShowTime: true,
                        subTitle2: item3[index].dateTime,
                        icon: CustomIconData().data(
                          ticket: item3[index].costType,
                        ),
                        title: item3[index].product,
                        subTitle: item3[index].costType,

                        actionTk: item3[index].cost,
                      );
                    },
                  ),
                );
        }
        return Center(child: CustomText(text: "No_data_found".tr));
      }),
    );
  }
}
