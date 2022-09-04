
# Flu Weather Project

Bir mobil hava durumu uygulamasıdır.   
  
## Yol haritası

- Görsel iyileştirmelerde bulunma

- Konumun yanında istediği şehrin hava durumunu görebilme

  
## Bilgisayarınızda Çalıştırın

Projeyi klonlayın

```bash
  git clone https://github.com/flyboy12/flu_weather_project.git
```

```bash
 flutter pub get 
 ```

 ```bash
Add to API_KEY 
 ```

  
## Ortam Değişkenleri

Bu projeyi çalıştırmak için aşağıdaki ortam değişkenini lib
/
utils
/
constants
/
api
/
api_key.dart dosyanıza eklemeniz gerekecek

`API_KEY`

[OpenWeatherAPI](https://openweathermap.org/api) 



  
## Flu Weather Özellikleri :

* Splash
* Home
* Error
* Routing
* Tema
* HTTP
* Database 
* GetX (State Management)
* Dil Desteği 
* Lokasyon Bazlı İşlemler
* İnternet Durumuna Göre İşlemler

### Kullanılan Paketler

* geolocator: ^9.0.1
* get: ^4.6.5
* http: ^0.13.5
* connectivity_plus: ^2.3.6+1
* sleek_circular_slider: ^2.0.1
* lottie: ^1.4.1
* shared_preferences: ^2.0.15
* intl: ^0.17.0

### Projenin Dosya Yapısı 
```
assets/
|- icons/
|- lottie/
|- weather/     
lib/
|- config/
    |- localization/
    |- route/
    |- theme/
|- feature/
    |- Home/
        |-view
        |-model
        |-widgets
        |-controller
    |- Splash/
        |-controller
        |-view
    |- Error/
        |-controller
        |-view
|- utils/
    |- components/
    |- constants/
    |- extension/
    |- helpers/
    |- services/
```   

## Uygulama Ekran Görünümü
  | Ana Sayfa I | Ana Sayfa II |
  | -------------  | ------------- |
  |![drawing](https://github.com/flyboy12/flu_weather_project/blob/main/screen_shot/Screenshot_1662327791.png?raw=true)|![drawing](https://github.com/flyboy12/flu_weather_project/blob/main/screen_shot/Screenshot_1662327800.png?raw=true)|
  |![drawing](https://github.com/flyboy12/flu_weather_project/blob/main/screen_shot/Screenshot_1662327891.png?raw=true)|![drawing](https://github.com/flyboy12/flu_weather_project/blob/main/screen_shot/Screenshot_1662327896.png?raw=true)|
