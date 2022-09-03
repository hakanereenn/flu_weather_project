// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

enum LottiePath { login_weather, no_internet, no_location }

extension LottiePathExt on LottiePath {
  String get path => "assets/lottie/$name.json";
  LottieBuilder getLottie() {
    return Lottie.asset(path);
  }

  Visibility getLottieVisibility(bool isVisible) {
    return Visibility(
      visible: isVisible,
      child: Center(
        child: getLottie(),
      ),
    );
  }
}
