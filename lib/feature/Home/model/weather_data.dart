import 'package:flutter_weather_project/feature/Home/model/weather_data_current.dart';
import 'package:flutter_weather_project/feature/Home/model/weather_data_daily.dart';
import 'package:flutter_weather_project/feature/Home/model/weather_data_hourly.dart';
import 'package:flutter_weather_project/feature/Home/model/weather_data_info.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;
  final WeatherDataInfo? info;

  WeatherData([this.info, this.current, this.hourly, this.daily]);

  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHourly getHourlyWeather() => hourly!;
  WeatherDataDaily getDailyWeather() => daily!;
  WeatherDataInfo getInfoWeather() => info!;
}
