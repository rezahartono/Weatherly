import 'package:weather/models/main_weather_model.dart';

class WeatherModel {
  int dateTime = 0;
  double temp = 0;
  double feelsLike = 0;
  double windSpeed = 0;
  int humidity = 0;
  int clouds = 0;
  List<MainWeatherModel> weather = [];

  WeatherModel({
    this.dateTime = 0,
    this.temp = 0,
    this.feelsLike = 0,
    this.windSpeed = 0,
    this.humidity = 0,
    this.clouds = 0,
    this.weather = const [],
  });

  WeatherModel.fromJson(Map<String, dynamic> json) {
    dateTime = json['dt'];
    temp = double.parse(json['temp'].toString());
    feelsLike = double.parse(json['feels_like'].toString());
    windSpeed = json['wind_speed'];
    humidity = json['humidity'];
    clouds = json['clouds'];
    weather = json['weather']
        .map<MainWeatherModel>((e) => MainWeatherModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'dt': dateTime,
      'temp': temp,
      'feels_like': feelsLike,
      'wind_speed': windSpeed,
      'humidity': humidity,
      'clouds': clouds,
      'weather': weather.map((e) => e.toJson()).toList(),
    };
  }
}
