import 'package:flutter_weather_project/config/route/app_pages.dart';
import 'package:flutter_weather_project/utils/helpers/model/permission_message.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/internet_connection_helper.dart';
import '../../../utils/helpers/location_helper.dart';
import '../../../utils/services/fetch_weather.dart';
import '../../Home/model/weather_data.dart';

class ErrorController extends GetxController {
  final Rx<WeatherData> weatherData = WeatherData().obs;
  RxDouble lat = 0.0.obs;
  RxDouble lon = 0.0.obs;

  late final LocationHelper _locationHelper = LocationHelper.instance;
  late final weatherApi = FetchWeatherAPI();
  late final InternetConnectionHelper _internetConnectionHelper =
      InternetConnectionHelper.instance;
  final RxBool _isConnected = false.obs;
  final RxBool _isLocation = false.obs;
  RxBool isConnected() => _isConnected;
  RxBool isLocation() => _isLocation;
  Future<void> errorHandler() async {
    PermissionMessage isConnectedPermission =
        await _internetConnectionHelper.isProcess();
    PermissionMessage locationPermission = await _locationHelper.isProcess();
    _isConnected.value = isConnectedPermission.succes;
    _isLocation.value = locationPermission.succes;
    if (_isLocation.isTrue) {
      lat.value = locationPermission.positionInfo!.lat!;
      lon.value = locationPermission.positionInfo!.lon!;
    }
    if (_isConnected.isTrue && _isLocation.isTrue) {
      getWeatherData();
    }
  }

  Future<void> getWeatherData() async {
    await weatherApi
        .processData(lat.value, lon.value)
        .then((value) => weatherData.value = value)
        .whenComplete(
            () => Get.offNamed(AppPages.Home, arguments: weatherData.value));
  }
}
