import 'package:flutter_weather_project/utils/services/fetch_weather.dart';

import '../constants/api/api_key.dart';


extension ApiUrl on FetchWeatherAPI {
  String apiUrl(var lat, var lon) {
    String url;
    url =
        "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=${ApiKey.API_KEY}&units=metric&exclude=minutely";
    return url;
  }
}
