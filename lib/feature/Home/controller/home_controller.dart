import 'package:flutter_weather_project/feature/Home/model/weather_data.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxInt _currentIndex = 0.obs;
  Rx<WeatherData> weatherData = WeatherData().obs;
  RxBool checkLoading() => _isLoading;
  RxInt connectionStatus = 0.obs;

  @override
  void onInit() {
    super.onInit();

    getIndex();
  }

  WeatherData getWeatherData() {
    return weatherData.value;
  }

  RxInt getIndex() {
    return _currentIndex;
  }
}
