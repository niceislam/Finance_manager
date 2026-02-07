import 'package:finance_management/app/data/model/firebase_get_model.dart';
import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/controller/report_controller/report.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReportBody extends StatelessWidget {
  const ReportBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ReportController controller = Get.put(ReportController());
    return Column(
      children: [
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(height: 20.h, width: size.width, color: Colors.teal),
              Padding(
                padding: EdgeInsets.only(top: 1),
                child: Container(
                  padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                    color: Colors.white,
                  ),
                  child: Obx(() {
                    final check = controller.HController.userAllData.value;
                    if (check == FirebaseGetModel()) {
                      return Center(
                        child: CustomText(text: "Something went wrong"),
                      );
                    }
                    return Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1.5,
                          child: PieChart(
                            PieChartData(
                              centerSpaceRadius: 0,
                              sections: [
                                PieChartSectionData(value: 10, radius: 120),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
