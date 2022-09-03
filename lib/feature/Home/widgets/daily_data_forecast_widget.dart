import 'package:flutter/material.dart';
import 'package:flutter_weather_project/feature/Home/model/weather_data_daily.dart';
import 'package:flutter_weather_project/utils/components/standart_divider.dart';
import 'package:flutter_weather_project/utils/extension/build_context.dart';
import 'package:flutter_weather_project/utils/extension/date_time.dart';
import 'package:get/get.dart';

class DailyDataForecast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyDataForecast({Key? key, required this.weatherDataDaily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context)
            .dividerColor
            .withAlpha(context.isLightMode ? 150 : 30),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10),
            child: Text("next_day".tr,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 16)),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        weatherDataDaily.daily[index + 1].dt.getDay(),
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color),
                      ),
                    ),
                    SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset(
                            "assets/weather/${weatherDataDaily.daily[index + 1].weather![0].icon}.png")),
                    Text(
                        "${weatherDataDaily.daily[index].temp!.max}°/${weatherDataDaily.daily[index + 1].temp!.min}°"),
                  ],
                ),
              ),
              StandartDivider(),
            ],
          );
        }),
        itemCount: weatherDataDaily.daily.length - 1 > 7
            ? 7
            : weatherDataDaily.daily.length - 1,
      ),
    );
  }
}
