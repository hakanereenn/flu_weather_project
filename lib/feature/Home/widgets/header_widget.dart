import 'package:flutter/material.dart';
import 'package:flutter_weather_project/feature/Home/model/weather_data_info.dart';
import 'package:flutter_weather_project/utils/extension/city_string.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class HeaderWidget extends StatelessWidget {
  final WeatherDataInfo? info;

  String date = DateFormat("yMMMd").format(DateTime.now());

  HeaderWidget(this.info, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: Text(
            info!.info.timezone!.fetchCityName(),
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Theme.of(context).textTheme.bodyLarge!.color),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.topLeft,
          child: Text(
            date,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
