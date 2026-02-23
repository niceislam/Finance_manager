import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../../data/dummy_data/report_page_color.dart';
import '../../../../../../Global_widget/custom_text.dart';
import '../../../../../../controller/report_controller/report.dart';

class ReportDetails extends StatelessWidget {
  const ReportDetails({super.key, required this.controller});

  final ReportController controller;

  @override
  Widget build(BuildContext context) {
    final item = controller.barChartReport.reversed.toList();
    if (controller.barChartReport.isNotEmpty) {
      return Expanded(
        child: ListView.builder(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemCount: item.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final percent =
                (item[index].cost! /
                controller.Hcontroller.userAllData.value.income!.toInt());
            return ListTile(
              dense: true,
              leading: CircleAvatar(
                radius: 6.r,
                backgroundColor: ReportPageColor()
                    .myColors[index % ReportPageColor().myColors.length],
              ),
              title: CustomText(
                text: "${item[index].product}",
                fontsize: 15.sp,
              ),
              subtitle: CustomText(
                text: "${item[index].costType}",
                textColor: Colors.grey,
                fontsize: 11.sp,
              ),
              trailing: CustomText(
                text: "$percent%",
                textColor: Colors.red,
                fontsize: 9.sp,
                fontWeight: FontWeight.w600,
              ),
            );
          },
        ),
      );
    }
    return Center(child: CustomText(text: "No_data_found".tr));
  }
}
