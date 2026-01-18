import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:finance_management/app/module/home/view/screen/add_transection_screen/widget/booklist_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookList extends StatelessWidget {
  const BookList({super.key, this.ontapSide, this.ontapFront, this.index});
  final VoidCallback? ontapSide;
  final VoidCallback? ontapFront;
  final int? index;

  @override
  Widget build(BuildContext context) {
    BooklistController controller = Get.put(BooklistController());
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: ontapSide,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: 230,
                  width: controller.status.value == index ? 0 : 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                        controller.status.value == index ? 0 : 2,
                      ),
                      bottomRight: Radius.circular(
                        controller.status.value == index ? 0 : 2,
                      ),
                      bottomLeft: Radius.circular(2),
                      topLeft: Radius.circular(2),
                    ),
                    color: Colors.red,
                  ),
                  child: Image.asset(
                    "assets/image/bookSide.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              //Front side
              GestureDetector(
                onTap: ontapFront,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: 230,
                  width: controller.status.value == index ? 170 : 0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        controller.status.value == index ? 0 : 2,
                      ),
                      bottomLeft: Radius.circular(
                        controller.status.value == index ? 0 : 2,
                      ),
                      bottomRight: Radius.circular(2),
                      topRight: Radius.circular(2),
                    ),
                    color: Colors.green,
                  ),
                  child: Image.asset(
                    "assets/image/bookFront.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
