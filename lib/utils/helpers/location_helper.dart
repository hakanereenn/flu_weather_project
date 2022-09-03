import 'package:flutter_weather_project/feature/Splash/controller/splash_controller.dart';
import 'package:flutter_weather_project/utils/helpers/IHelper.dart';
import 'package:flutter_weather_project/utils/helpers/cache_helper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/permission_message.dart';

class LocationHelper extends IHelper {
  static LocationHelper? _instance;
  static LocationHelper get instance {
    _instance ??= LocationHelper._init();
    return _instance!;
  }

  LocationHelper._init();

  Future<PermissionMessage> getLocation() async {
    PermissionMessage message = PermissionMessage(
      message: "location_load_error",
      succes: false,
      onStatus: ProcessStatus.noLocation,
    );

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      CacheValue.lat.set(value.latitude);
      CacheValue.lon.set(value.longitude);
      return message = PermissionMessage(
          message: "location_load",
          succes: true,
          onStatus: ProcessStatus.getContent,
          positionInfo: PositionInfo(
              lat: value.latitude, lon: value.longitude, isCached: false));
    });

    return message;
  }

  @override
  Future<PermissionMessage> isProcess() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      double lat = sharedPreferences.getDouble(CacheValue.lat.name) ?? 0.0;
      double lon = sharedPreferences.getDouble(CacheValue.lon.name) ?? 0.0;
      if (!(lat == 0.0 && lon == 0.0)) {
        return PermissionMessage(
            message: "past_location_load",
            succes: true,
            onStatus: ProcessStatus.getContent,
            positionInfo: PositionInfo(lat: lat, lon: lon, isCached: true));
      }
      return PermissionMessage(
          message: 'location_service_not_enabled',
          onStatus: ProcessStatus.noLocation,
          succes: false);
    }
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return PermissionMessage(
          message: 'location_permission_forever_denied',
          onStatus: ProcessStatus.noLocation,
          succes: false);
    } else if (locationPermission == LocationPermission.denied) {
      // izin alma isteği yolla
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return PermissionMessage(
            message: 'location_permission_denied',
            onStatus: ProcessStatus.noLocation,
            succes: false);
      }
    }

    // izin alma

    return await getLocation();
  }
}
