import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../Global_widget/custom_text.dart';

class ReportDropdown extends StatelessWidget {
  const ReportDropdown({
    super.key,
    this.dropValue,
    this.itemList,
    this.onchanged,
  });

  final String? dropValue;
  final List? itemList;
  final ValueChanged? onchanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 100.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.shade100,
      ),
      child: Center(
        child: DropdownButton<String>(
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(10),
          underline: SizedBox(),
          isDense: true,

          value: dropValue,
          items: itemList?.map<DropdownMenuItem<String>>((v) {
            return DropdownMenuItem(
              value: v,
              child: CustomText(text: v, fontsize: 13.sp),
            );
          }).toList(),
          onChanged: onchanged,
        ),
      ),
    );
  }
}
