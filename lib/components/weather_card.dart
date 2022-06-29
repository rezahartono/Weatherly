import 'package:flutter/material.dart';

import 'package:weather/utils/size_config.dart';
import 'package:weather/utils/theme.dart';

class WeatherCard extends StatelessWidget {
  final String iconUrl;
  final String value;
  final String title;

  const WeatherCard({
    Key? key,
    required this.iconUrl,
    required this.value,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SIZE_CONFIG.BLOCK_HORIZONTAL * 6,
          child: Image.asset(
            iconUrl,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: SIZE_CONFIG.DEFAULT_MARGIN / 2,
        ),
        Text(
          value,
          style: TEXT_STYLE.PRIMARY.copyWith(
            fontSize: 13,
          ),
        ),
        Text(
          title,
          style: TEXT_STYLE.PRIMARY.copyWith(
            fontSize: 12,
            color: COLOR.WHITE.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
