import 'package:flutter/material.dart';
import 'package:flutter_weather_project/feature/Home/model/weather_data_current.dart';
import 'package:flutter_weather_project/utils/components/standart_sized_box.dart';
import 'package:flutter_weather_project/utils/extension/build_context.dart';
import 'package:flutter_weather_project/utils/extension/image_path.dart';

import '../../../utils/components/standart_divider.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tempeatureAreaWidget(context),
        StandartSizedBox(),
        currentWeatherMoreDetailsWidget(context),
      ],
    );
  }

  Widget tempeatureAreaWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
          height: 80,
          width: 50,
        ),
        StandartVerticalDivider(height: 50, horizontalPadding: 0),
        Text("${weatherDataCurrent.current.temp!.toInt()}°",
            style: Theme.of(context).textTheme.headline2),
      ],
    );
  }

  Widget currentWeatherMoreDetailsWidget(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ImagePath.windspeed.currentWeatherDetailIcon(context),
          ImagePath.clouds.currentWeatherDetailIcon(context),
          ImagePath.humidity.currentWeatherDetailIcon(context),
        ],
      ),
      StandartSizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ImagePath.windspeed.currentWeatherDetailValue(weatherDataCurrent),
          ImagePath.clouds.currentWeatherDetailValue(weatherDataCurrent),
          ImagePath.humidity.currentWeatherDetailValue(weatherDataCurrent),
        ],
      ),
    ]);
  }
}

extension WeatherMoreDetailsExtension on ImagePath {
  Container currentWeatherDetailIcon(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context)
            .dividerColor
            .withAlpha(context.isLightMode ? 150 : 30),
        borderRadius: BorderRadius.circular(15),
      ),
      child: getImage(),
    );
  }

  SizedBox currentWeatherDetailValue(WeatherDataCurrent weatherDataCurrent) {
    return SizedBox(
      height: 20,
      width: 60,
      child: Text(
        _currentWeatherData(weatherDataCurrent),
        style: const TextStyle(fontSize: 12),
        textAlign: TextAlign.center,
      ),
    );
  }

  String _currentWeatherData(WeatherDataCurrent weatherDataCurrent) {
    switch (index) {
      case 0:
        return "${weatherDataCurrent.current.windSpeed!.toString()} km/h";
      case 1:
        return "${weatherDataCurrent.current.clouds!.toString()} km/h";
      case 2:
        return "${weatherDataCurrent.current.humidity!.toString()}%";
      default:
        return "";
    }
  }
}
