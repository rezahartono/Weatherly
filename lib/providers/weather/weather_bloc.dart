import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/models/daily_weather_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherService _ws = WeatherService();

  WeatherBloc() : super(WeatherInitial()) {
    on<GetCurrentWeather>((event, emit) async {
      // TODO: implement event handler
      emit(WeatherLoading());

      final result = await _ws.getCurrentWeather(
        lat: event.lat,
        long: event.long,
      );

      result.fold(
        (errorMessage) => emit(
          WeatherError(errorMessage: errorMessage),
        ),
        (currentWeather) => emit(
          CurrentWeatherSuccess(currentWeather: currentWeather),
        ),
      );
    });
    on<GetHourlyWeather>((event, emit) async {
      // TODO: implement event handler
      emit(WeatherLoading());

      final result = await _ws.getHourlyWeather(
        lat: event.lat,
        long: event.long,
      );

      result.fold(
        (errorMessage) => emit(
          WeatherError(errorMessage: errorMessage),
        ),
        (hourlyWeather) => emit(
          HourlyWeatherSuccess(hourlyWeather: hourlyWeather),
        ),
      );
    });
    on<GetDailyWeather>((event, emit) async {
      // TODO: implement event handler
      emit(WeatherLoading());

      final result = await _ws.getDailyWeather(
        lat: event.lat,
        long: event.long,
      );

      result.fold(
        (errorMessage) => emit(
          WeatherError(errorMessage: errorMessage),
        ),
        (dailyWeather) => emit(
          DailyWeatherSuccess(dailyWeather: dailyWeather),
        ),
      );
    });
  }
}
