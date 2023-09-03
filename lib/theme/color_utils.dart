import 'package:fluffy_train/models/lesson.dart';
import 'package:fluffy_train/modules/helpers/string_helpers.dart';
import 'package:fluffy_train/theme/colors.dart';
import 'package:flutter/material.dart';

class ColorUtils {
  static Color getColor(Subject subject, int level) {
    Map<Class, Color>? colorMap;

    if (level == 5) {
      return DefaultTheme.golden[Golden.level5]!;
    }

    switch (subject) {
      case Subject.history:
        colorMap = DefaultTheme.history;
        break;
      case Subject.perception:
        colorMap = DefaultTheme.perception;
        break;
      case Subject.rythm:
        colorMap = DefaultTheme.rythm;
        break;
      case Subject.sheet:
        colorMap = DefaultTheme.sheet;
        break;
    }

    return colorMap[getLevelFromInt(level)] ?? Colors.black;
  }

  static Color getIconColor(Subject subject, int level) {
    Map<Class, Color>? colorMap;

    if (level == 5) {
      return DefaultTheme.golden[Golden.secondary]!;
    }

    switch (subject) {
      case Subject.history:
        colorMap = DefaultTheme.history;
        break;
      case Subject.perception:
        colorMap = DefaultTheme.perception;
        break;
      case Subject.rythm:
        colorMap = DefaultTheme.rythm;
        break;
      case Subject.sheet:
        colorMap = DefaultTheme.sheet;
        break;
    }

    return colorMap[Class.secondary] ?? Colors.black;
  }
}
