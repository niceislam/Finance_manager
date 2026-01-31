import 'dart:io';

import 'package:finance_management/app/module/home/controller/drawer_controller/drawer_controller.dart';
import 'package:finance_management/app/module/home/controller/home_controller/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddImage extends StatelessWidget {
  const AddImage({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomRight,
      children: [
        Obx(
          () => Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: BoxBorder.all(color: Colors.teal, width: 1),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.teal,
              radius: 40,
              backgroundImage: controller.imagePath.value.isEmpty
                  ? const AssetImage("assets/image/noImage.webp")
                  : FileImage(File(controller.imagePath.value)),
            ),
          ),
        ),
        Positioned(
          bottom: -2,
          child: GestureDetector(
            onTap: () {
              Get.bottomSheet(
                BottomSheet(
                  onClosing: () {},
                  builder: (v) {
                    return Container(
                      padding: EdgeInsets.only(left: 25),
                      height: 80,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        spacing: 10,
                        children: [
                          pickImageOperate(
                            ontap: () {
                              controller.galleryImage();
                            },
                          ),
                          pickImageOperate(
                            ontap: () {
                              controller.cameraImage();
                            },
                            icon: Icons.add_a_photo_outlined,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
            child: CircleAvatar(
              backgroundColor: Colors.teal.shade50,
              radius: 16,
              child: Center(
                child: Icon(
                  Icons.add_a_photo_outlined,
                  size: 20,
                  color: Colors.teal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  GestureDetector pickImageOperate({
    required VoidCallback ontap,
    IconData? icon,
  }) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.teal.shade50,
        ),
        child: Icon(
          icon ?? Icons.add_photo_alternate_outlined,
          size: 45,
          color: Colors.grey,
        ),
      ),
    );
  }
}
