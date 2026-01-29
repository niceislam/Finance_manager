import 'dart:developer';

import 'package:finance_management/app/data/local/secure_storage/secure_storage.dart';
import 'package:finance_management/app/module/home/controller/languages_controller/languages_controller.dart';
import 'package:finance_management/app/module/home/view/screen/splash_sreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:workmanager/workmanager.dart';


// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     print("Background task: $task");
//     return Future.value(true);
//   });
// }


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Workmanager().initialize(callbackDispatcher);
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  var es = await LocalStorage().readData(key: "language");
  runApp(MyApp(status: es));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.status});
  final String? status;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LanguagesController(),
      locale: status == "E" ? Locale("en", "US") : Locale("bn", "BD"),
      fallbackLocale: Locale("en", "US"),
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
