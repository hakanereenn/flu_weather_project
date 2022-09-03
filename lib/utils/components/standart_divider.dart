import 'package:flutter/material.dart';

import '../constants/theme/custom_colors.dart';

// ignore: non_constant_identifier_names
Divider StandartDivider() {
  return const Divider(
    height: 1,
    color: CustomColors.dividerLine,
  );
}

// ignore: non_constant_identifier_names
Container StandartVerticalDivider(
    {double height = 25, double horizontalPadding = 40}) {
  return Container(
      height: height,
      margin: horizontalPadding == 0
          ? null
          : EdgeInsets.symmetric(horizontal: horizontalPadding),
      width: 1,
      color: CustomColors.dividerLine);
}
