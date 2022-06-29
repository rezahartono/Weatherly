import 'package:flutter/material.dart';

import 'package:weather/utils/size_config.dart';
import 'package:weather/utils/theme.dart';

class ExtraWeatherCard extends StatelessWidget {
  final bool isActive;
  final int value;
  final String iconUrl;
  final String time;

  const ExtraWeatherCard({
    Key? key,
    this.isActive = false,
    required this.value,
    required this.iconUrl,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SIZE_CONFIG.BLOCK_HORIZONTAL * 20,
      padding: const EdgeInsets.all(1),
      decoration: isActive
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(
                SIZE_CONFIG.BLOCK_HORIZONTAL * 7,
              ),
              gradient: LinearGradient(
                colors: [
                  COLOR.LIGHT_BLUE,
                  COLOR.BLUE,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            )
          : BoxDecoration(
              color: COLOR.DARK,
              borderRadius: BorderRadius.circular(
                SIZE_CONFIG.BLOCK_HORIZONTAL * 7,
              ),
            ),
      child: Container(
        width: SIZE_CONFIG.DEFAULT_MARGIN,
        padding: EdgeInsets.symmetric(
          vertical: SIZE_CONFIG.DEFAULT_MARGIN / 2,
        ),
        decoration: BoxDecoration(
          color: isActive ? COLOR.TRANSPARENT : COLOR.PRIMARY,
          borderRadius: BorderRadius.circular(
            SIZE_CONFIG.BLOCK_HORIZONTAL * 7,
          ),
        ),
        child: Column(
          children: [
            Text(
              '$value\u00B0',
              style: TEXT_STYLE.PRIMARY.copyWith(
                fontSize: 16,
                fontWeight: FONT_WEIGHT.BOLD,
              ),
            ),
            SizedBox(
              height: SIZE_CONFIG.BLOCK_VERTICAL * 5,
              child: Image.network(
                iconUrl,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              time,
              style: TEXT_STYLE.PRIMARY.copyWith(
                fontSize: 12,
                color: COLOR.WHITE.withOpacity(0.5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
