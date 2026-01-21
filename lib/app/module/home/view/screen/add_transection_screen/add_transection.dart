import 'package:finance_management/app/module/home/Global_widget/custom_appbar.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/controller/add_transection_controller/add_transection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTransection extends StatelessWidget {
  const AddTransection({super.key});

  @override
  Widget build(BuildContext context) {
    AddTraController controller = Get.put(AddTraController());
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
                  padding: EdgeInsets.only(top: 20, left: 15, right: 15),
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
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Transection Type",
                        fontWeight: FontWeight.w900,
                        fontsize: 18,
                      ),

                      Obx(
                        () => Row(
                          spacing: 10,
                          children: [
                            Expanded(
                              child: _buildContainer(
                                size,
                                conColor: controller.pageNumber.value == 0
                                    ? Colors.red
                                    : Colors.teal.shade200,
                                ontap: () {
                                  controller.pageNumber.value = 0;
                                },
                                title: "Expense",
                              ),
                            ),
                            Expanded(
                              child: _buildContainer(
                                size,
                                title: "Income",
                                ontap: () {
                                  controller.pageNumber.value = 1;
                                },
                                conColor: controller.pageNumber.value == 1
                                    ? Colors.red
                                    : Colors.teal.shade200,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: PageView(
                          onPageChanged: (v) {
                            controller.onPageChanged(pageNum: v);
                          },
                          controller: PageController(initialPage: controller.pageNumber.value),
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              height: 70,
                              width: size.width,
                              color: Colors.green,
                            ),
                            Container(
                              height: 70,
                              width: size.width,
                              color: Colors.red,
                            ),
                          ],
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

  GestureDetector _buildContainer(
    Size size, {

    VoidCallback? ontap,
    Color? conColor,
    String? title,
  }) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 45,
        width: size.width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: conColor,
        ),
        child: Center(
          child: Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_downward, color: Colors.white),
              CustomText(
                text: "${title ?? ""}",
                fontsize: 17,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
