import 'dart:developer';

import 'package:finance_management/app/module/home/Global_widget/custom_appbar.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTransection extends StatelessWidget {
  const AddTransection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppbar(
          leadingTap: () {
            Get.back();
          },

          leadingIcon: Icon(Icons.arrow_back_ios, color: Colors.white),
          centerText: "Add Transection",
          actionTap: () {},
          actionIcon: CustomText(
            text: "Save",
            textColor: Colors.white,
            fontsize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 40),
                  height: 80,
                  width: MediaQuery.sizeOf(context).width,
                  color: Colors.indigo,
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
