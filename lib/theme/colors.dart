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

enum Class {
  secondary,
  level1,
  level2,
  level3,
  level4,
}

enum Golden {
  secondary,
  level5,
}

enum Reds {
  mahogany,
  sangria,
  brick,
  candy,
  crismon,
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
  static const Map<Reds, Color> reds = {
    Reds.mahogany: Color(0xFF800000),
    Reds.sangria: Color(0xFF961E1D),
    Reds.brick: Color(0xFFB22222),
    Reds.candy: Color(0xFFFF2400),
    Reds.crismon: Color(0xFFDC143C),
  };
  static const Map<Class, Color> history = {
    Class.secondary: Color(0xFFFFDAB9),
    Class.level1: Color(0xFFFFB366),
    Class.level2: Color(0xFFFFA500),
    Class.level3: Color(0xFFFF8C00),
    Class.level4: Color(0xFFFF4500),
  };
  static const Map<Class, Color> perception = {
    Class.secondary: Color(0xFFFFA7B9),
    Class.level1: Color(0xFFFF8FA0),
    Class.level2: Color(0xFFFF778C),
    Class.level3: Color(0xFFFF5F79),
    Class.level4: Color(0xFFFF465F),
  };
  static const Map<Class, Color> rythm = {
    Class.secondary: Color(0xFFD5FFA2),
    Class.level1: Color(0xFFB0E57C),
    Class.level2: Color(0xFF9CEA5E),
    Class.level3: Color(0xFF84DF3F),
    Class.level4: Color(0xFF6BD420),
  };
  static const Map<Class, Color> sheet = {
    Class.secondary: Color(0xFF87C5FF),
    Class.level1: Color(0xFF58A6FF),
    Class.level2: Color(0xFF3D8EFF),
    Class.level3: Color(0xFF2676FF),
    Class.level4: Color(0xFF0C5DFF),
  };
  static const Map<Golden, Color> golden = {
    Golden.secondary: Color(0xFFFFEC88),
    Golden.level5: Color(0xFFFFD700),
  };

  static const Color transparent = Color(0x00000000);

  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: DefaultTheme.grayscale[Grayscale.white],
  );
}
