import 'package:flutter/material.dart';
import 'package:weather/utils/size_config.dart';
import 'package:weather/utils/theme.dart';

class NoInternetConnectionView extends StatelessWidget {
  const NoInternetConnectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR.PRIMARY,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No Internet Connection',
            style: TEXT_STYLE.PRIMARY.copyWith(
              fontSize: 24,
              fontWeight: FONT_WEIGHT.BOLD,
            ),
          ),
          SizedBox(
            height: SIZE_CONFIG.DEFAULT_MARGIN,
          ),
          SizedBox(
            width: SIZE_CONFIG.BLOCK_HORIZONTAL * 35,
            height: SIZE_CONFIG.BLOCK_VERTICAL * 6,
            child: TextButton.icon(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => COLOR.BLUE,
                ),
                overlayColor: MaterialStateProperty.resolveWith(
                  (states) => COLOR.DARK,
                ),
                shape: MaterialStateProperty.resolveWith(
                  (states) => RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              icon: Icon(
                Icons.refresh,
                color: COLOR.WHITE,
              ),
              label: Text(
                'Refresh',
                style: TEXT_STYLE.PRIMARY,
              ),
            ),
          )
        ],
      ),
    );
  }
}
