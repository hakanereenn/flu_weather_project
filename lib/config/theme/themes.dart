import 'package:flutter/material.dart';

class Themes {
  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: const Color(0xffFAFAFA),
    primaryColor: const Color(0xff005691),
    dividerColor: const Color(0xffE8F1F5),
    backgroundColor: const Color(0xffE8F1F5),
    colorScheme: const ColorScheme.light(
      primary: Color(0xff9ED2C6),
      secondary: Color(0xff005691),
      error: Color(0xffC21010),
      background: Color(0xffE8F1F5),
    ),
  );
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xff272643),
    primaryColor: const Color(0xffbae8e8),
    dividerColor: const Color(0xffe3f6f5),
    backgroundColor: const Color(0xff2c698d),
    colorScheme: const ColorScheme.light(
      primary: Color(0xffbae8e8),
      secondary: Color(0xff2c698d),
      error: Color(0xffffffff),
      background: Color(0xff272643),
    ),
  );
}
