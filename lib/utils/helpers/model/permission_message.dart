import 'package:flutter_weather_project/feature/Splash/controller/splash_controller.dart';

class PermissionMessage {
  final String message;
  final bool succes;
  final ProcessStatus onStatus;
  PositionInfo? positionInfo;
  PermissionMessage(
      {required this.message,
      required this.succes,
      required this.onStatus,
      this.positionInfo});
}

class PositionInfo {
  final double? lat;
  final double? lon;
  final bool isCached;

  PositionInfo({required this.lat, required this.lon, required this.isCached});
}
