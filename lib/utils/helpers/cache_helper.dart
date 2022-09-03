import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static CacheHelper? _instance;
  static CacheHelper get instance {
    _instance ??= CacheHelper._init();
    return _instance!;
  }

  CacheHelper._init();

  Future setDouble(String key, double value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setDouble(key, value);
  }

  Future<double> getDouble(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? 0.0;
  }
}

enum CacheValue { lat, lon }

extension CacheValueExtension on CacheValue {
  void set(double value) {
    CacheHelper cacheHelper = CacheHelper.instance;
    cacheHelper.setDouble(name, value);
  }
}
