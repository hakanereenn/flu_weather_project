import 'package:flutter/material.dart';
import 'package:flutter_weather_project/feature/Home/controller/home_controller.dart';
import 'package:flutter_weather_project/feature/Home/model/weather_data.dart';
import 'package:flutter_weather_project/feature/Home/widgets/daily_data_forecast_widget.dart';
import 'package:flutter_weather_project/feature/Home/widgets/hourly_data_widget.dart';
import 'package:flutter_weather_project/utils/components/standart_divider.dart';
import 'package:get/get.dart';

import '../../../utils/components/standart_sized_box.dart';
import '../widgets/weather_details_widget.dart';
import '../widgets/current_weather_widget.dart';
import '../widgets/header_widget.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController controller = Get.put(HomeController(), permanent: true);
  WeatherData? weatherData = Get.arguments as WeatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          StandartSizedBox(),
          HeaderWidget(
            weatherData!.info!,
          ),
          CurrentWeatherWidget(
            weatherDataCurrent: weatherData!.current!,
          ),
          StandartSizedBox(),
          HourlyDataWidget(
            weatherDataHourly: weatherData!.hourly,
          ),
          StandartSizedBox(),
          DailyDataForecast(
            weatherDataDaily: weatherData!.daily!,
          ),
          StandartSizedBox(height: 10),
          StandartDivider(),
          StandartSizedBox(height: 10),
          WeatherDetailsWidget(
            weatherDataCurrent: weatherData!.current!,
          ),
        ],
      )),
    );
  }
}
