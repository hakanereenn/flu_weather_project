import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_weather_project/config/route/app_pages.dart';
import 'package:flutter_weather_project/feature/Splash/controller/splash_controller.dart';
import 'package:flutter_weather_project/utils/extension/lottie_path.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController controller = Get.put(SplashController());
  @override
  void initState() {
    startTime();
    super.initState();
  }

  startTime() async {
    var duration = const Duration(seconds: 10);
    return Timer(duration, route);
  }

  route() {
    switch (controller.getStatus.value) {
      case ProcessStatus.success:
        return Get.offNamed(AppPages.Home,
            arguments: controller.weatherData.value);
      case ProcessStatus.noLocation:
      case ProcessStatus.noNetwork:
      case ProcessStatus.noContent:
        return Get.offNamed(AppPages.Error);
      case ProcessStatus.loading:
      case ProcessStatus.getContent:
      case ProcessStatus.getLocalization:
      case ProcessStatus.getInternet:
        return const WaitingSplash();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const WaitingSplash();
  }
}

class WaitingSplash extends StatelessWidget {
  const WaitingSplash({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: LottiePath.login_weather.getLottie(),
          ),
        ],
      ),
    );
  }
}
