import 'dart:developer';

import 'package:finance_management/app/module/home/Global_widget/custom_appbar.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/view/screen/add_transection_screen/widget/book_list.dart';
import 'package:finance_management/app/module/home/view/screen/add_transection_screen/widget/booklist_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTransection extends StatelessWidget {
  const AddTransection({super.key});

  @override
  Widget build(BuildContext context) {
    BooklistController controller = Get.put(BooklistController());
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      CustomText(
                        text: "Book Store",
                        fontWeight: FontWeight.w900,
                        fontsize: 30,
                      ),
                      SizedBox(height: 20),

                      SizedBox(
                        height: 230,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: BookList(
                                index: index,
                                ontapFront: () {
                                  if (controller.status.value != index) {
                                    controller.status.value = index;
                                  } else {
                                    controller.status.value = -1;
                                  }
                                },
                                ontapSide: () {
                                  if (controller.status.value != index) {
                                    controller.status.value = index;
                                  } else {
                                    controller.status.value = -1;
                                  }
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
