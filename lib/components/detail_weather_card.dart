import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

import 'package:weather/components/weather_card.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/utils/common_generic.dart';
import 'package:weather/utils/date_time_utils.dart';
import 'package:weather/utils/size_config.dart';
import 'package:weather/utils/theme.dart';

class DetailWeatherCard extends StatelessWidget {
  final WeatherModel currentWeather;

  const DetailWeatherCard({
    Key? key,
    required this.currentWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // header builder
    Widget _headerBuilder() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: SIZE_CONFIG.DEFAULT_MARGIN,
          vertical: SIZE_CONFIG.DEFAULT_MARGIN / 2,
        ),
        margin: EdgeInsets.only(top: SIZE_CONFIG.APP_BAR_SIZE),
        width: SIZE_CONFIG.SCREEN_WIDTH,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: SIZE_CONFIG.BLOCK_HORIZONTAL * 11,
              height: SIZE_CONFIG.BLOCK_HORIZONTAL * 11,
              child: Center(
                child: Image.asset(
                  'assets/icons/ic_menu.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: SIZE_CONFIG.BLOCK_HORIZONTAL * 6,
                  child: Center(
                    child: Image.asset(
                      'assets/icons/ic_calendar.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: SIZE_CONFIG.DEFAULT_MARGIN / 2,
                ),
                Text(
                  '7 Days',
                  style: TEXT_STYLE.PRIMARY.copyWith(
                    fontSize: 22,
                    fontWeight: FONT_WEIGHT.BOLD,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: SIZE_CONFIG.BLOCK_HORIZONTAL * 7,
              height: SIZE_CONFIG.BLOCK_HORIZONTAL * 7,
              child: Center(
                child: Image.asset(
                  'assets/icons/ic_setting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      );
    }
    // end builder

    // weather information builder
    Widget _weatherInformationBuilder() {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: SIZE_CONFIG.DEFAULT_MARGIN / 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: SIZE_CONFIG.BLOCK_VERTICAL * 15,
              child: Center(
                child: Image.network(
                  'http://openweathermap.org/img/wn/${currentWeather.weather.first.iconCode}@4x.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DATE_TIME.GET_DAY(currentWeather.dateTime),
                  style: TEXT_STYLE.PRIMARY.copyWith(
                    fontSize: 18,
                    fontWeight: FONT_WEIGHT.BOLD,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GlowText(
                      COMMON
                          .KELVIN_TO_CELSIUS(currentWeather.temp)
                          .toStringAsFixed(0),
                      style: TEXT_STYLE.PRIMARY.copyWith(
                        fontSize: 64,
                        height: 1,
                        fontWeight: FONT_WEIGHT.BOLD,
                      ),
                    ),
                    Text(
                      '/${COMMON.KELVIN_TO_CELSIUS(currentWeather.feelsLike).toStringAsFixed(0)}\u00B0',
                      textAlign: TextAlign.start,
                      style: TEXT_STYLE.PRIMARY.copyWith(
                        fontSize: 36,
                        height: 0.80,
                        fontWeight: FONT_WEIGHT.BOLD,
                        color: COLOR.WHITE.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
                Text(
                  currentWeather.weather.first.name,
                  textAlign: TextAlign.start,
                  style: TEXT_STYLE.PRIMARY.copyWith(
                    fontSize: 16,
                    fontWeight: FONT_WEIGHT.BOLD,
                    color: COLOR.WHITE.withOpacity(0.4),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }
    // end builder

    // extra weather information builder
    Widget _extraWeatherInformationBuilder() {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SIZE_CONFIG.DEFAULT_MARGIN,
          vertical: SIZE_CONFIG.DEFAULT_MARGIN / 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: SIZE_CONFIG.BLOCK_HORIZONTAL * 23,
              child:  WeatherCard(
                iconUrl: 'assets/icons/ic_wind.png',
                value: '${currentWeather.windSpeed}kmph',
                title: 'Wind',
              ),
            ),
             WeatherCard(
              iconUrl: 'assets/icons/ic_humidity.png',
              value: '${currentWeather.humidity}%',
              title: 'Humidity',
            ),
             WeatherCard(
              iconUrl: 'assets/icons/ic_chance_rain.png',
              value: '${currentWeather.clouds}%',
              title: 'Chance of Rain',
            ),
          ],
        ),
      );
    }
    // end builder

    return Container(
      width: SIZE_CONFIG.SCREEN_WIDTH,
      height: SIZE_CONFIG.BLOCK_VERTICAL * 42,
      margin: EdgeInsets.symmetric(
        horizontal: SIZE_CONFIG.DEFAULT_MARGIN / 2,
      ),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            COLOR.TRANSPARENT,
            COLOR.LIGHT_BLUE,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(
          SIZE_CONFIG.BLOCK_HORIZONTAL * 10,
        ),
        boxShadow: [
          BoxShadow(
            color: COLOR.BLUE.withOpacity(0.5),
            offset: Offset(0, SIZE_CONFIG.BLOCK_VERTICAL * 2.8),
            spreadRadius: -8,
            blurRadius: 1,
          ),
        ],
      ),
      child: Container(
        width: SIZE_CONFIG.SCREEN_WIDTH - 4,
        height: SIZE_CONFIG.BLOCK_VERTICAL * 43,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              COLOR.LIGHT_BLUE,
              COLOR.BLUE,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(
            SIZE_CONFIG.BLOCK_HORIZONTAL * 10,
          ),
        ),
        child: Column(
          children: [
            _headerBuilder(),
            _weatherInformationBuilder(),
            _extraWeatherInformationBuilder(),
          ],
        ),
      ),
    );
  }
}
