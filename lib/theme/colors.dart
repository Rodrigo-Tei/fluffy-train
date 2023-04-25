import 'package:flutter/material.dart';

enum Grayscale {
  black,
  lightBlack,
  darkGray,
  gray,
  lightGray,
  lightestGray,
  white
}

class DefaultTheme {
  static const double colorOpacity = 0.08;

  static const Map<Grayscale, Color> grayscale = {
    Grayscale.black: Color(0xFF1E2535),
    Grayscale.lightBlack: Color(0x8E1E2535),
    Grayscale.darkGray: Color(0xFF5D7186),
    Grayscale.gray: Color(0xFF9DA9B6),
    Grayscale.lightGray: Color(0xFFDDE5ED),
    Grayscale.lightestGray: Color(0xFFF4F7F9),
    Grayscale.white: Colors.white,
  };

  static const Color transparent = Color(0x00000000);

  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: DefaultTheme.grayscale[Grayscale.white],
    fontFamily: 'Roboto',
  );
}
