import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'weather': 'Weather',
          'today': 'Today',
          'next_day': 'Next Day',
          'weather_details': 'Weather Details',
          'feels_like': 'Feels Like ',
          'humidity': 'Humidity',
          'uvi': 'UV ',
          'internet_connection': 'Connected to the Internet',
          'no_internet_connection': 'Unable to Connect to Internet',
          'location_load_error': 'Location Upload Error Received',
          'location_load': 'Location Is Successfully Loaded',
          'past_location_load': 'Location Information Remaining from Past Use',
          'location_service_not_enabled': 'Location Service Is Not Enabled',
          'location_permission_forever_denied':
              'Location Permission Is Forever Denied',
          'location_permission_denied': 'Location Permission Is Denied',
        },
        'tr_TR': {
          'weather': 'Hava Durumu',
          'today': 'Bugün',
          'next_day': 'Önümüzdeki Hafta',
          'weather_details': 'Ayrıntılar',
          'feels_like': 'Hissedilen ',
          'humidity': 'Nem',
          'uvi': 'UV ',
          'internet_connection': 'İnternete Bağlanıldı',
          'no_internet_connection': 'İnternete Bağlanılamadı',
          'location_load_error': 'Konum Yükleme Hatası Alındı',
          'location_load': 'Konum Başarıyla Yüklendi',
          'past_location_load': 'Geçmişte Kullanımdan Kalan Konum Bilgileri',
          'location_service_not_enabled': 'Konum Hizmeti Etkin Değil',
          'location_permission_forever_denied':
              'Konum İzni Sonsuza Kadar Reddedildi',
          'location_permission_denied': 'Konum İzni Reddedildi',
        }
      };
}
