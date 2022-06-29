import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:weather/models/daily_weather_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/utils/environment.dart';
import 'package:weather/utils/string_constant.dart';

class WeatherService {
  // get current weather service
  Future<Either<String, WeatherModel>> getCurrentWeather({
    required double lat,
    required double long,
  }) async {
    final url = ENV.BASE_URL(
      path:
          '/onecall?lat=$lat&lon=$long&exclude=minutely,hourly,daily,alerts&appid=${ENV.API_KEY}',
    );

    var response = await http.get(
      url,
      headers: STRING_CONSTANT.HEADERS(),
    );

    if (response.statusCode == 200) {
      WeatherModel currentWeather =
          WeatherModel.fromJson(json.decode(response.body)['current']);

      return Right(currentWeather);
    } else {
      return Left('Gagal Ambil Data!');
    }
  }

  // get hourly weather service
  Future<Either<String, List<WeatherModel>>> getHourlyWeather({
    required double lat,
    required double long,
  }) async {
    final url = ENV.BASE_URL(
      path:
          '/onecall?lat=$lat&lon=$long&exclude=minutely,daily,alerts,current&appid=${ENV.API_KEY}',
    );

    var response = await http.get(
      url,
      headers: STRING_CONSTANT.HEADERS(),
    );

    if (response.statusCode == 200) {
      List responseData = json.decode(response.body)['hourly'];
      List<WeatherModel> hourlyWeather = [];

      for (var data in responseData) {
        hourlyWeather.add(WeatherModel.fromJson(data));
      }

      return Right(hourlyWeather);
    } else {
      return Left('Gagal Ambil Data!');
    }
  }

  // get weekly weather service
  Future<Either<String, List<DailyWeatherModel>>> getDailyWeather({
    required double lat,
    required double long,
  }) async {
    final url = ENV.BASE_URL(
      path:
          '/onecall?lat=$lat&lon=$long&exclude=minutely,hourly,alerts,current&appid=${ENV.API_KEY}',
    );

    var response = await http.get(
      url,
      headers: STRING_CONSTANT.HEADERS(),
    );

    if (response.statusCode == 200) {
      List responseData = json.decode(response.body)['daily'];
      List<DailyWeatherModel> dailyWeather = [];

      for (var data in responseData) {
        dailyWeather.add(DailyWeatherModel.fromJson(data));
      }

      return Right(dailyWeather);
    } else {
      return Left('Gagal Ambil Data!');
    }
  }
}
