// ignore_for_file: non_constant_identifier_names, unnecessary_new

import 'package:flutter/material.dart';

class ColorTheme {
  final Color PRIMARY = const Color(0xFF000918);
  final Color SECONDARY = const Color(0xFF68798F);
  final Color WHITE = const Color(0xFFFFFFFF);
  final Color LIGHT_BLUE = const Color(0xFF7ED7F5);
  final Color BLUE = const Color(0xFF126CF4);
  final Color YELLOW = const Color(0xFFFFF30F);
  final Color DARK = const Color(0xFF272727);
  final Color TRANSPARENT = Colors.transparent;
}

class TextStyleTheme {
  TextStyle PRIMARY = TextStyle(
    fontFamily: 'Open Sauce Sans',
    color: COLOR.WHITE,
    fontSize: 14,
    fontWeight: FONT_WEIGHT.REGULAR,
    fontStyle: FONT_STYLE.NORMAL,
  );
  TextStyle SECONDARY = TextStyle(
    fontFamily: 'Open Sauce Sans',
    color: COLOR.SECONDARY,
    fontSize: 14,
    fontWeight: FONT_WEIGHT.REGULAR,
    fontStyle: FONT_STYLE.NORMAL,
  );
}

class FontWeightTheme {
  final FontWeight LIGHT = FontWeight.w300;
  final FontWeight REGULAR = FontWeight.w400;
  final FontWeight MEDIUM = FontWeight.w500;
  final FontWeight SEMI_BOLD = FontWeight.w600;
  final FontWeight BOLD = FontWeight.w700;
  final FontWeight EXTRA_BOLD = FontWeight.w800;
}

class FontStyleTheme {
  final FontStyle ITALIC = FontStyle.italic;
  final FontStyle NORMAL = FontStyle.normal;
}

ColorTheme COLOR = new ColorTheme();
FontStyleTheme FONT_STYLE = new FontStyleTheme();
FontWeightTheme FONT_WEIGHT = new FontWeightTheme();
TextStyleTheme TEXT_STYLE = new TextStyleTheme();
