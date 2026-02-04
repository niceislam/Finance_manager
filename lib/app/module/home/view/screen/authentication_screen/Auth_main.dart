import 'package:finance_management/app/module/home/Global_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Global_widget/custom_appbar.dart';
import '../../../controller/authentication_controller/login_controller.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(53),
          child: CustomAppbar(centerText: "Poysha"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildInkWell(
                        ontap: () {
                          controller.signIndex.value = 0;
                        },
                        context,
                        title: 'Sign in',
                        conColor: controller.signIndex.value == 0
                            ? Colors.teal
                            : Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: _buildInkWell(
                        ontap: () {
                          controller.signIndex.value = 1;
                        },
                        context,
                        title: 'Sign up',
                        conColor: controller.signIndex.value == 1
                            ? Colors.teal
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    child: controller.newUserPage[controller.signIndex.value],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector _buildInkWell(
    BuildContext context, {
    required String title,
    required conColor,
    VoidCallback? ontap,
  }) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        spacing: 6,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: "${title}",
            fontsize: 14.w,
            fontWeight: FontWeight.w500,
          ),
          Container(
            height: 3,
            width: MediaQuery.sizeOf(context).width,
            color: conColor,
          ),
        ],
      ),
    );
  }
}
