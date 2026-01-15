import 'package:get/get.dart';

import '../../view/screen/home_screen/bottom_home/home_body/home_body.dart';
import '../../view/screen/home_screen/bottom_home/report_body/report_body.dart';
import '../../view/screen/home_screen/bottom_home/transection_body/transection_body.dart';

class HomeController extends GetxController {
  RxInt bottomIndex = 0.obs;

  RxList bottomPage = [home_body(), TransectionBody(), ReportBody()].obs;
}
