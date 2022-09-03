import 'package:flutter/material.dart';
import 'package:flutter_weather_project/feature/Error/controller/error_controller.dart';
import 'package:flutter_weather_project/utils/extension/lottie_path.dart';
import 'package:get/get.dart';

class ErrorScreen extends StatelessWidget {
  ErrorScreen({
    Key? key,
  }) : super(key: key);
  final ErrorController controller = Get.put(ErrorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          controller.errorHandler();
          controller.update;
        },
        child: ListView(
          children: [
            Obx(() => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LottiePath.no_internet
                        .getLottieVisibility(controller.isConnected().isFalse),
                    LottiePath.no_location.getLottieVisibility(
                        controller.isConnected().isTrue
                            ? controller.isLocation().isFalse
                            : false),
                    LottiePath.login_weather.getLottieVisibility(
                        controller.isConnected().isTrue &&
                                controller.isLocation().isTrue
                            ? true
                            : false),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
