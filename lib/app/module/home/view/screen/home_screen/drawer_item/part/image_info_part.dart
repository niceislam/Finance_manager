import 'dart:io';
import 'package:finance_management/app/module/home/controller/drawer_controller/drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Global_widget/custom_text.dart';

class ImageAndInfo extends StatelessWidget {
  const ImageAndInfo({super.key, required this.controller});
  final AppDrawerController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final item = controller.homeController.userAllData.value;
      final imageItem = controller.homeController.showImage.value;
      return Row(
        spacing: 5,
        children: [
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: BoxBorder.all(color: Colors.teal, width: 1),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.teal,
              radius: 33,
              backgroundImage: imageItem != ""
                  ? FileImage(File(imageItem))
                  : AssetImage("assets/image/noImage.webp"),
            ),
          ),
          Expanded(
            flex: 11,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  maxline: 1,
                  text: item.name ?? "",
                  fontWeight: FontWeight.w600,
                  fontsize: 18,
                  textOverflow: TextOverflow.ellipsis,
                ),
                CustomText(
                  maxline: 1,
                  text: item.profession ?? "",
                  fontsize: 13,
                  textColor: Colors.grey,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                controller.homeController.updateInfo(
                  item: controller.homeController.userAllData.value,
                );
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey.shade100,
                child: Center(
                  child: Icon(Icons.edit, size: 23, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
