part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  // ignore: constant_identifier_names
  static const Home = _Paths.Home;
  // ignore: constant_identifier_names
  static const Splash = _Paths.Splash;
  // ignore: constant_identifier_names
  static const Error = _Paths.Error;
}

abstract class _Paths {
  // ignore: constant_identifier_names
  static const Home = '/home';
  // ignore: constant_identifier_names
  static const Splash = '/splash';
  // ignore: constant_identifier_names, unused_field
  static const Error = '/error';
}
