import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../Global_widget/custom_Textfield.dart';
import '../../../../../../controller/transection_controller/transection_controller.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.size,
    required this.controller,
  });

  final Size size;
  final TransectionController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 80,
      width: size.width,
      color: Colors.indigo,
      child: Obx(
        () => CustomTextField(
          controller: controller.searchController,
          focusedBorder: BorderSide.none,
          sufIcon: InkWell(
            onTap: () {
              controller.searchClearTap();
            },
            child: controller.iconActive.value == true
                ? Icon(Icons.close)
                : SizedBox(),
          ),
          preIcon: Icon(Icons.search, color: Colors.grey),
          hintText: "Search here...",
          borderSide: BorderSide.none,
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
