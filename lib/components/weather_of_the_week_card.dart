import 'package:flutter/material.dart';

import 'package:weather/utils/size_config.dart';
import 'package:weather/utils/theme.dart';

class WeatherOfTheWeekCard extends StatelessWidget {
  final String dayName;
  final String iconUrl;
  final String weatherName;
  final int firstVal;
  final int secondVal;

  const WeatherOfTheWeekCard({
    Key? key,
    required this.dayName,
    required this.iconUrl,
    required this.weatherName,
    required this.firstVal,
    required this.secondVal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SIZE_CONFIG.DEFAULT_MARGIN,
        vertical: SIZE_CONFIG.DEFAULT_MARGIN / 2,
      ),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FixedColumnWidth(SIZE_CONFIG.BLOCK_HORIZONTAL * 20),
          1: FixedColumnWidth(SIZE_CONFIG.BLOCK_HORIZONTAL * 45),
          2: FixedColumnWidth(SIZE_CONFIG.BLOCK_HORIZONTAL * 12),
        },
        children: [
          TableRow(
            children: [
              Text(
                dayName,
                style: TEXT_STYLE.SECONDARY.copyWith(
                  fontSize: 16,
                  fontWeight: FONT_WEIGHT.MEDIUM,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: SIZE_CONFIG.BLOCK_VERTICAL * 5,
                    child: Image.network(
                      iconUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    weatherName,
                    style: TEXT_STYLE.SECONDARY.copyWith(
                      fontSize: 16,
                      fontWeight: FONT_WEIGHT.MEDIUM,
                    ),
                  ),
                ],
              ),
              Text(
                '+$firstVal\u00B0',
                style: TEXT_STYLE.PRIMARY.copyWith(
                  fontSize: 16,
                  fontWeight: FONT_WEIGHT.MEDIUM,
                ),
              ),
              Text(
                '+$secondVal\u00B0',
                style: TEXT_STYLE.SECONDARY.copyWith(
                  fontSize: 16,
                  fontWeight: FONT_WEIGHT.MEDIUM,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
