class WeatherDataInfo {
  final WeatherInfo info;
  WeatherDataInfo({required this.info});
  factory WeatherDataInfo.fromJson(Map<String, dynamic> json) =>
      WeatherDataInfo(info: WeatherInfo.fromJson(json));
}

class WeatherInfo {
  WeatherInfo({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
  });

  double? lat;
  double? lon;
  String? timezone;
  int? timezoneOffset;

  factory WeatherInfo.fromJson(Map<String, dynamic> json) => WeatherInfo(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
      };
}
