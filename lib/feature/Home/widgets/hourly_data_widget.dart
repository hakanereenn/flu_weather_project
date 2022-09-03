import 'package:flutter/material.dart';
import 'package:flutter_weather_project/feature/Home/controller/home_controller.dart';
import 'package:flutter_weather_project/feature/Home/model/weather_data_hourly.dart';
import 'package:flutter_weather_project/utils/extension/build_context.dart';
import 'package:flutter_weather_project/utils/extension/date_time.dart';
import 'package:get/get.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly? weatherDataHourly;
  HourlyDataWidget({Key? key, required this.weatherDataHourly})
      : super(key: key);
  final RxInt cardIndex = HomeController().getIndex();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          alignment: Alignment.centerLeft,
          child: Text(
            "today".tr,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return Container(
        height: 160,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) => Obx((() => GestureDetector(
                onTap: () {
                  cardIndex.value = index;
                },
                child: hourly(index, context),
              )))),
          itemCount: weatherDataHourly!.hourly.length > 12
              ? 14
              : weatherDataHourly!.hourly.length,
        ));
  }

  Container hourly(int index, BuildContext context) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(left: 20, right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0.5, 0),
              blurRadius: 30,
              spreadRadius: 1,
              color: Theme.of(context)
                  .dividerColor
                  .withAlpha(context.isLightMode ? 150 : 30),
            ),
          ],
          gradient: cardIndex.value == index
              ? LinearGradient(colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).colorScheme.secondary
                ])
              : null),
      child: HourlyDetails(
        index: index,
        cardIndex: cardIndex.toInt(),
        temp: weatherDataHourly!.hourly[index].temp!,
        timeStamp: weatherDataHourly!.hourly[index].dt!,
        weatherIcon: weatherDataHourly!.hourly[index].weather![0].icon!,
      ),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  final int temp;
  final int index;
  final int cardIndex;
  final int timeStamp;
  final String weatherIcon;
  const HourlyDetails(
      {Key? key,
      required this.temp,
      required this.timeStamp,
      required this.weatherIcon,
      required this.index,
      required this.cardIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            timeStamp.getTime(),
            style: TextStyle(color: indexToColor(context)),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: Image.asset(
            "assets/weather/$weatherIcon.png",
            height: 40,
            width: 40,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "$temp°",
            style: TextStyle(color: indexToColor(context)),
          ),
        )
      ],
    );
  }

  Color indexToColor(BuildContext context) {
    return cardIndex == index
        ? Theme.of(context).scaffoldBackgroundColor
        : Theme.of(context).primaryColor;
  }
}
