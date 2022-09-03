extension CityString on String? {
  String fetchCityName() {
    int index = this!.indexOf('/');
    String city = this!.substring(index + 1);
    return city;
  }
}
