import 'package:get/get.dart';

// ignore: non_constant_identifier_names
SnackbarController StandartSnackBar(String message, {int seconds = 10}) {
  return Get.showSnackbar(GetSnackBar(
    title: "Flu-Weather",
    message: message.tr,
    duration: Duration(seconds: seconds),
  ));
}
