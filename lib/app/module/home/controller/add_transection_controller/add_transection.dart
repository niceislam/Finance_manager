import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddTraController extends GetxController {
  PageController pageController = PageController();
  RxInt pageNumber = 0.obs;

  onPageChanged({required int pageNum}) {
    pageNumber.value = pageNum;
  }



}
