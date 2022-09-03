import 'package:flutter/material.dart';
import 'package:flutter_weather_project/config/localization/localization_manager.dart';
import 'package:flutter_weather_project/config/localization/massages.dart';
import 'package:flutter_weather_project/config/route/app_pages.dart';
import 'package:flutter_weather_project/config/theme/themes.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final LocalizationManager _localizationManager = LocalizationManager.instance;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      localizationsDelegates: _localizationManager.localizationsDelegates,
      supportedLocales: _localizationManager.supportedLocales,
      locale: Get.deviceLocale,
      onInit: () {
        _localizationManager.setIntlLoaclization();
      },
      fallbackLocale: _localizationManager.enLocale,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      initialRoute: AppPages.Initial,
      getPages: AppPages.routes,
      title: "weather".tr,
      debugShowCheckedModeBanner: false,
    );
  }
}
