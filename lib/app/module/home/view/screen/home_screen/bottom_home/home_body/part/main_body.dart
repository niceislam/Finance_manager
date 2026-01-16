import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/bottom_home/home_body/part/percent_part.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../../../Global_widget/history_card.dart';

class main_body extends StatelessWidget {
  const main_body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade200,
      ),
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 65, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            //percent part
            percent_part(
              size: size,
              name: "Nice Islam",
              profession: "Flutter App Developer",
              age: "21",
              monthlyIncome: 40000,
              expense: 12000,
            ),

            //income and expense
            Row(
              children: [
                _buildContainer(
                  title: 'Income',
                  tk: '4000',
                  conColor: Colors.teal.shade50,
                  textColor: Colors.teal,
                  size: size,
                ),
                _buildContainer(
                  title: 'Expense',
                  tk: '1500',
                  conColor: Colors.red.shade50,
                  textColor: Colors.red,
                  size: size,
                ),
              ],
            ),

            //recent transaction
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Recent Transection",
                  fontWeight: FontWeight.w900,
                  fontsize: 17,
                ),
                CustomText(
                  text: "12",
                  fontWeight: FontWeight.w900,
                  fontsize: 17,
                  textColor: Colors.grey,
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return HistoryCard(
                  icon: Icon(Icons.card_travel),
                  title: "Grocery Shop",
                  subTitle: "shopping",
                  actionTk: "\$2500",
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildContainer({
    required String title,
    String? tk,
    required Color conColor,
    required Color textColor,
    required Size size,
  }) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 70,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
          color: conColor,
        ),
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              spacing: 2,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "${title}",
                  fontWeight: FontWeight.w600,
                  textColor: textColor,
                  fontsize: 15,
                ),
                CustomText(
                  text: "\$${tk ?? ""}",
                  fontWeight: FontWeight.w600,
                  textColor: textColor,
                  fontsize: 15,
                ),
              ],
            ),
            Icon(Icons.arrow_downward, size: 25, color: textColor),
          ],
        ),
      ),
    );
  }
}
