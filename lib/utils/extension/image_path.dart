import 'package:flutter/material.dart';


enum ImagePath { windspeed, clouds, humidity }

extension ImagePathExt on ImagePath {
  String get path => "assets/icons/$name.png";
  Image getImage() {
    return Image.asset(path);
  }
}
