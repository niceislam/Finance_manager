import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/controller/transection_controller/transection_controller.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/bottom_home/transection_body/part/history_list.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/bottom_home/transection_body/part/search_bar.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/bottom_home/transection_body/part/slide_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TransectionBody extends StatelessWidget {
  const TransectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    TransectionController Trcontroller = Get.put(TransectionController());

    Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              //search bar
              CustomSearchBar(size: size, controller: Trcontroller),

              //body
              Container(
                padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                margin: EdgeInsets.only(top: 60),
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SlideButtoon(size: size, Trcontroller: Trcontroller),
                    SizedBox(height: 9.h),
                    Obx(
                      () => Row(
                        children: [
                          CustomText(
                            fontsize: 15.sp,
                            fontWeight: FontWeight.w600,
                            text: Trcontroller.slideOnEnd.value == true
                                ? "Tr_slideBtn_right".tr
                                : "Tr_slideBtn_left".tr,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),

                    //History List
                    History_list(controller: Trcontroller),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
