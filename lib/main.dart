import 'package:finance_management/app/module/home/controller/languages_controller/languages_controller.dart';
import 'package:finance_management/app/module/home/view/screen/authentication_screen/Auth_main.dart';
import 'package:finance_management/app/module/home/view/screen/home_screen/home_screen.dart';
import 'package:finance_management/app/module/home/view/screen/splash_sreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LanguagesController(),
      locale: Locale("bn", "BD"),
      fallbackLocale: Locale("en", "US"),
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
