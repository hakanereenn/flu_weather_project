import 'package:get/get.dart';

import '../../feature/Error/view/error_view.dart';
import '../../feature/Home/view/home_view.dart';
import '../../feature/Splash/View/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  // ignore: constant_identifier_names
  static const Initial = Routes.Splash;
  // ignore: constant_identifier_names
  static const Home = Routes.Home;
  // ignore: constant_identifier_names
  static const Error = Routes.Error;



  static final routes = [
    GetPage(
      name: _Paths.Home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: _Paths.Splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name:  _Paths.Error,
      page: () => ErrorScreen(),

    ),
  ];
}
