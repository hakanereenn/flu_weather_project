import 'package:flutter/material.dart';
import 'package:flutter_weather_project/feature/Home/model/weather_data_current.dart';
import 'package:flutter_weather_project/utils/components/standart_divider.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class WeatherDetailsWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const WeatherDetailsWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
          child: Text(
            "weather_details".tr,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                        handlerSize: 0, trackWidth: 12, progressBarWidth: 12),
                    infoProperties: InfoProperties(
                        modifier: (percentage) {
                          return "${percentage.ceil()}%";
                        },
                        mainLabelStyle: Theme.of(context).textTheme.headline5,
                        bottomLabelText: "humidity".tr,
                        bottomLabelStyle:
                            Theme.of(context).textTheme.headline6),
                    animationEnabled: true,
                    size: 140,
                    customColors: CustomSliderColors(
                      hideShadow: true,
                      trackColor: Theme.of(context).primaryColor.withAlpha(100),
                      progressBarColors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).colorScheme.secondary,
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  comfortLevelRichText("feels_like".tr,
                      "${weatherDataCurrent.current.feelsLike!}°", context),
                  StandartVerticalDivider(),
                  comfortLevelRichText("uvi".tr,
                      weatherDataCurrent.current.uviIndex!.toString(), context),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  RichText comfortLevelRichText(
      String text, String value, BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          TextSpan(
            text: value,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
