import 'dart:convert';

import 'package:flutter_weather_project/feature/Home/model/weather_data.dart';
import 'package:flutter_weather_project/feature/Home/model/weather_data_current.dart';
import 'package:flutter_weather_project/feature/Home/model/weather_data_daily.dart';
import 'package:flutter_weather_project/feature/Home/model/weather_data_hourly.dart';
import 'package:flutter_weather_project/feature/Home/model/weather_data_info.dart';
import 'package:flutter_weather_project/utils/extension/api_url.dart';
import 'package:http/http.dart' as http;

class FetchWeatherAPI {
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon) async {
    var respnse = await http.get(Uri.parse(apiUrl(lat, lon)));
    var jsonString = jsonDecode(respnse.body);
    weatherData = WeatherData(
      WeatherDataInfo.fromJson(jsonString),
      WeatherDataCurrent.fromJson(jsonString),
      WeatherDataHourly.fromJson(jsonString),
      WeatherDataDaily.fromJson(jsonString),
    );
    return weatherData!;
  }
}
