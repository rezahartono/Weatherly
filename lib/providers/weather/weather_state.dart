part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherError extends WeatherState {
  final String errorMessage;

  const WeatherError({
    required this.errorMessage,
  });
}

class CurrentWeatherSuccess extends WeatherState {
  final WeatherModel currentWeather;

  const CurrentWeatherSuccess({
    required this.currentWeather,
  });
}

class HourlyWeatherSuccess extends WeatherState {
  final List<WeatherModel> hourlyWeather;

  const HourlyWeatherSuccess({
    required this.hourlyWeather,
  });
}

class DailyWeatherSuccess extends WeatherState {
  final List<DailyWeatherModel> dailyWeather;

  const DailyWeatherSuccess({
    required this.dailyWeather,
  });
}
