part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentWeather extends WeatherEvent {
  final double lat;
  final double long;

  const GetCurrentWeather({
    required this.lat,
    required this.long,
  });
}

class GetHourlyWeather extends WeatherEvent {
  final double lat;
  final double long;

  const GetHourlyWeather({
    required this.lat,
    required this.long,
  });
}

class GetDailyWeather extends WeatherEvent {
  final double lat;
  final double long;

  const GetDailyWeather({
    required this.lat,
    required this.long,
  });
}
