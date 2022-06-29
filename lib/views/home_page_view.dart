import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather/components/extra_weather_card.dart';
import 'package:weather/components/loading.dart';
import 'package:weather/components/main_weather_card.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/models/location_model.dart';
import 'package:weather/providers/weather/weather_bloc.dart';
import 'package:weather/utils/common_generic.dart';
import 'package:weather/utils/date_time_utils.dart';
import 'package:weather/utils/size_config.dart';
import 'package:weather/utils/theme.dart';
import 'package:weather/views/detail_page_view.dart';
import 'package:weather/views/no_internet_connection_view.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  LocationModel location = LocationModel(
    lat: 0,
    long: 0,
    cityName: '',
  );
  WeatherModel currentWeather = WeatherModel();
  bool _isConnectionSuccessful = false;

  @override
  void initState() {
    super.initState();
    _checkConnection();
  }

  // check connection method
  Future<void> _checkConnection() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');

      setState(() {
        _isConnectionSuccessful = response.isNotEmpty;
      });
    } on SocketException catch (e) {
      setState(() {
        _isConnectionSuccessful = false;
      });
    }

    if (_isConnectionSuccessful) {
      _getCurrentLocation();
    } else {
      Get.offAll(const NoInternetConnectionView());
    }
  }

  // get current location method
  _getCurrentLocation() async {
    BlocProvider.of<WeatherBloc>(context).emit(WeatherLoading());
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission != LocationPermission.denied) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        setState(() {
          location = LocationModel(
            lat: position.latitude,
            long: position.longitude,
            cityName: placemarks.first.subAdministrativeArea!.replaceAll(
              'Kota ',
              '',
            ),
          );
        });
      }

      BlocProvider.of<WeatherBloc>(context).add(
        GetCurrentWeather(
          lat: position.latitude,
          long: position.longitude,
        ),
      );
    }
  }
  // end method

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    // extra weather builder
    Widget _extraWeatherBuilder(List<WeatherModel> hourlyWeather) {
      return Container(
        margin: EdgeInsets.only(top: SIZE_CONFIG.DEFAULT_MARGIN),
        padding: EdgeInsets.symmetric(
          vertical: SIZE_CONFIG.DEFAULT_MARGIN / 2,
          horizontal: SIZE_CONFIG.DEFAULT_MARGIN,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: TEXT_STYLE.PRIMARY.copyWith(
                    fontSize: 18,
                    fontWeight: FONT_WEIGHT.EXTRA_BOLD,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(
                      DetailPageView(location: location),
                    );
                  },
                  child: Text(
                    '7 days>',
                    style: TEXT_STYLE.PRIMARY.copyWith(
                      fontSize: 12,
                      color: COLOR.WHITE.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SIZE_CONFIG.DEFAULT_MARGIN / 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: hourlyWeather
                  .sublist(0, 4)
                  .map(
                    (e) => ExtraWeatherCard(
                      isActive: DATE_TIME.IS_TODAY_DATE(e.dateTime),
                      value: int.parse(
                        COMMON.KELVIN_TO_CELSIUS(e.temp).toStringAsFixed(0),
                      ),
                      iconUrl:
                          'http://openweathermap.org/img/wn/${e.weather.first.iconCode}@4x.png',
                      time: DATE_TIME.GET_HOUR(e.dateTime),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      );
    }
    // end builder

    return Scaffold(
      backgroundColor: COLOR.PRIMARY,
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is CurrentWeatherSuccess) {
            context.read<WeatherBloc>().add(
                  GetHourlyWeather(
                    lat: location.lat,
                    long: location.long,
                  ),
                );

            setState(() {
              currentWeather = state.currentWeather;
            });
          }
        },
        builder: (context, state) {
          if (state is HourlyWeatherSuccess) {
            return Column(
              children: [
                MainWeatherCard(
                  currentWeather: currentWeather,
                  location: location,
                ),
                _extraWeatherBuilder(
                  state.hourlyWeather,
                ),
              ],
            );
          } else {
            return const Loading();
          }
        },
      ),
    );
  }
}
