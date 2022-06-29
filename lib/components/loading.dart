import 'package:flutter/material.dart';
import 'package:weather/utils/size_config.dart';
import 'package:weather/utils/theme.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR.PRIMARY,
      width: SIZE_CONFIG.SCREEN_WIDTH,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: SIZE_CONFIG.BLOCK_HORIZONTAL * 6,
            height: SIZE_CONFIG.BLOCK_HORIZONTAL * 6,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: COLOR.WHITE,
            ),
          ),
          SizedBox(height: SIZE_CONFIG.DEFAULT_MARGIN / 2),
          Text(
            'Loading...',
            style: TEXT_STYLE.PRIMARY,
          ),
        ],
      ),
    );
  }
}
