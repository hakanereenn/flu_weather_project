import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LocalizationManager {
  static LocalizationManager? _instance;
  static LocalizationManager get instance {
    _instance ??= LocalizationManager._init();
    return _instance!;
  }

  LocalizationManager._init();
  void setIntlLoaclization() {
    if (Get.deviceLocale == LocalizationManager.instance.trLocale) {
      Intl.defaultLocale = 'tr';
    } else {
      Intl.defaultLocale = 'en';
    }
  }

  final trLocale = const Locale('tr', 'TR');
  final enLocale = const Locale('en', 'US');
  Iterable<LocalizationsDelegate<dynamic>> get localizationsDelegates => [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];
  List<Locale> get supportedLocales => [enLocale, trLocale];
}
