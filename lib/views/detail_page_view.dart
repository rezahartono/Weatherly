import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:weather/components/detail_weather_card.dart';
import 'package:weather/components/loading.dart';
import 'package:weather/components/weather_of_the_week_card.dart';
import 'package:weather/models/daily_weather_model.dart';
import 'package:weather/models/location_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather/weather_bloc.dart';
import 'package:weather/utils/common_generic.dart';
import 'package:weather/utils/date_time_utils.dart';
import 'package:weather/utils/theme.dart';

class DetailPageView extends StatefulWidget {
  final LocationModel location;

  const DetailPageView({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  State<DetailPageView> createState() => _DetailPageViewState();
}

class _DetailPageViewState extends State<DetailPageView> {
  WeatherModel currentWeather = WeatherModel();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherBloc>(context).add(
      GetCurrentWeather(
        lat: widget.location.lat,
        long: widget.location.long,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // list Week of weather builder
    Widget _listWeekOfWeatherBuilder(List<DailyWeatherModel> dailyWeather) {
      return Expanded(
        child: ListView(
          children: dailyWeather
              .sublist(0, 7)
              .map(
                (e) => WeatherOfTheWeekCard(
                  dayName: DATE_TIME.GET_DAY_NAME(e.dateTime),
                  iconUrl:
                      'http://openweathermap.org/img/wn/${e.weather.first.iconCode}@4x.png',
                  weatherName: e.weather.first.name,
                  firstVal: int.parse(
                    COMMON.KELVIN_TO_CELSIUS(e.temp).toStringAsFixed(0),
                  ),
                  secondVal: int.parse(
                    COMMON.KELVIN_TO_CELSIUS(e.feelsLike).toStringAsFixed(0),
                  ),
                ),
              )
              .toList(),
        ),
      );
    }
    // end builder

    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<WeatherBloc>(context).add(
          GetCurrentWeather(
            lat: widget.location.lat,
            long: widget.location.long,
          ),
        );
        return true;
      },
      child: Scaffold(
        backgroundColor: COLOR.PRIMARY,
        body: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is CurrentWeatherSuccess) {
              context.read<WeatherBloc>().add(
                    GetDailyWeather(
                      lat: widget.location.lat,
                      long: widget.location.long,
                    ),
                  );

              setState(() {
                currentWeather = state.currentWeather;
              });
            }
          },
          builder: (context, state) {
            if (state is DailyWeatherSuccess) {
              return Column(
                children: [
                  DetailWeatherCard(
                    currentWeather: currentWeather,
                  ),
                  _listWeekOfWeatherBuilder(
                    state.dailyWeather,
                  ),
                ],
              );
            } else {
              return const Loading();
            }
          },
        ),
      ),
    );
  }
}
