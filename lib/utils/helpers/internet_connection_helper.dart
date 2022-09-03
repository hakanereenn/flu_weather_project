import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_weather_project/feature/Splash/controller/splash_controller.dart';
import 'package:flutter_weather_project/utils/helpers/IHelper.dart';

import 'model/permission_message.dart';

class InternetConnectionHelper extends IHelper {
  static InternetConnectionHelper? _instance;
  static InternetConnectionHelper get instance {
    _instance ??= InternetConnectionHelper._init();
    return _instance!;
  }

  InternetConnectionHelper._init();
  @override
  Future<PermissionMessage> isProcess() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    bool internetStatus = false;
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      internetStatus = true;
    }
    String internetStatusMessage =
        internetStatus ? "internet_connection" : "no_internet_connection";
    ProcessStatus status = internetStatus
        ? ProcessStatus.getLocalization
        : ProcessStatus.noNetwork;
    PermissionMessage permissionMessage = PermissionMessage(
        message: internetStatusMessage,
        succes: internetStatus,
        onStatus: status);
    return permissionMessage;
  }
}
