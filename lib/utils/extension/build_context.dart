import 'package:flutter/material.dart';

extension IsDarkMode on BuildContext {
  bool get isLightMode =>
      MediaQuery.of(this).platformBrightness == Brightness.light;
}
