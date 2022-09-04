import 'package:flutter_weather_project/utils/components/standart_snack_bar.dart';
import 'package:flutter_weather_project/utils/helpers/internet_connection_helper.dart';
import 'package:flutter_weather_project/utils/helpers/location_helper.dart';
import 'package:flutter_weather_project/utils/services/fetch_weather.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/model/permission_message.dart';
import '../../Home/model/weather_data.dart';

enum ProcessStatus {
  loading,
  noNetwork,
  noContent,
  getLocalization,
  getInternet,
  noLocation,
  getContent,
  success,
}

class SplashController extends GetxController {
  late final LocationHelper _locationHelper = LocationHelper.instance;
  late final weatherApi = FetchWeatherAPI();
  late final InternetConnectionHelper _internetConnectionHelper =
      InternetConnectionHelper.instance;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final Rx<WeatherData> weatherData = WeatherData().obs;
  final Rx<ProcessStatus> _status = ProcessStatus.loading.obs;
  Rx<ProcessStatus> get getStatus => _status;
  RxDouble getLattitude() => _lattitude;
  RxDouble getLongitude() => _longitude;
  @override
  void onInit() {
    onInitData();
    super.onInit();
  }

  bool getPermissions<T>(PermissionMessage message, {isLocation = false}) {
    _status.value = message.onStatus;
    if (isLocation && message.succes) {
      _lattitude.value = message.positionInfo!.lat!;
      _longitude.value = message.positionInfo!.lon!;
    }
    if (!message.succes) {
      StandartSnackBar(message.message);
    }

    return message.succes;
  }

  void onInitData() async {
    bool isInternet =
        getPermissions(await _internetConnectionHelper.isProcess());
    if (isInternet) {
      bool isLocation =
          getPermissions(await _locationHelper.isProcess(), isLocation: true);
      if (isInternet && isLocation) {
        await getWeatherData();
      }
    }
  }

  Future<void> getWeatherData() async {
    await weatherApi
        .processData(_lattitude.value, _longitude.value)
        .then((value) => weatherData.value = value)
        .whenComplete(() => _status.value = ProcessStatus.success);
  }
}
