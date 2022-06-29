import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

import 'package:weather/components/weather_card.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/models/location_model.dart';
import 'package:weather/utils/common_generic.dart';
import 'package:weather/utils/date_time_utils.dart';
import 'package:weather/utils/size_config.dart';
import 'package:weather/utils/theme.dart';

class MainWeatherCard extends StatelessWidget {
  final LocationModel location;
  final WeatherModel currentWeather;

  const MainWeatherCard({
    Key? key,
    required this.location,
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
                      'assets/icons/ic_location.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: SIZE_CONFIG.DEFAULT_MARGIN / 2,
                ),
                Text(
                  location.cityName,
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

    // Updated information builder
    Widget _updatedInformationBuilder() {
      return Container(
        width: SIZE_CONFIG.BLOCK_HORIZONTAL * 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            SIZE_CONFIG.BLOCK_HORIZONTAL * 20,
          ),
          border: Border.all(
            width: 1,
            color: COLOR.WHITE,
          ),
        ),
        padding: EdgeInsets.all(SIZE_CONFIG.DEFAULT_MARGIN / 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: SIZE_CONFIG.BLOCK_HORIZONTAL * 3,
              height: SIZE_CONFIG.BLOCK_HORIZONTAL * 3,
              decoration: BoxDecoration(
                color: COLOR.YELLOW,
                borderRadius: BorderRadius.circular(
                  SIZE_CONFIG.BLOCK_HORIZONTAL * 2,
                ),
              ),
            ),
            SizedBox(
              width: SIZE_CONFIG.DEFAULT_MARGIN / 2,
            ),
            Text(
              'Updated 10min ago',
              style: TEXT_STYLE.PRIMARY.copyWith(
                fontSize: 12,
              ),
            ),
          ],
        ),
      );
    }
    // end builder

    // weather image builder
    Widget _weatherImageBuilder() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: SIZE_CONFIG.DEFAULT_MARGIN),
        height: SIZE_CONFIG.BLOCK_VERTICAL * 25,
        child: Center(
          child: Image.network(
            'http://openweathermap.org/img/wn/${currentWeather.weather.first.iconCode}@4x.png',
            fit: BoxFit.cover,
          ),
        ),
      );
    }
    // end builder

    // weather information builder
    Widget _weatherInformationBuilder() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: SIZE_CONFIG.DEFAULT_MARGIN * 2.5,
              ),
              GlowText(
                COMMON.KELVIN_TO_CELSIUS(currentWeather.temp).toStringAsFixed(0),
                style: TEXT_STYLE.PRIMARY.copyWith(
                  fontSize: 150,
                  height: 0.80,
                  fontWeight: FONT_WEIGHT.BOLD,
                ),
              ),
              Text(
                '\u00B0',
                textAlign: TextAlign.start,
                style: TEXT_STYLE.PRIMARY.copyWith(
                  fontSize: 80,
                  height: 0.80,
                  fontWeight: FONT_WEIGHT.BOLD,
                  color: COLOR.WHITE.withOpacity(0.4),
                ),
              )
            ],
          ),
          Text(
            currentWeather.weather.first.name,
            style: TEXT_STYLE.PRIMARY.copyWith(
              fontSize: 22,
              fontWeight: FONT_WEIGHT.EXTRA_BOLD,
            ),
          ),
          Text(
            DATE_TIME.GET_DATE_TIME(currentWeather.dateTime),
            style: TEXT_STYLE.PRIMARY.copyWith(
              fontSize: 12,
              color: COLOR.WHITE.withOpacity(0.5),
            ),
          ),
          SizedBox(
            height: SIZE_CONFIG.DEFAULT_MARGIN / 2,
          ),
        ],
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
              child: WeatherCard(
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
      height: SIZE_CONFIG.BLOCK_VERTICAL * 79,
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
        height: SIZE_CONFIG.BLOCK_VERTICAL * 80,
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
            _updatedInformationBuilder(),
            _weatherImageBuilder(),
            _weatherInformationBuilder(),
            _extraWeatherInformationBuilder(),
          ],
        ),
      ),
    );
  }
}
