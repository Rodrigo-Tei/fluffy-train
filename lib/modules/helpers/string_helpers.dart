import 'package:fluffy_train/theme/colors.dart';

getLevelFromInt(int string) {
  switch (string) {
    case 1:
      return Class.level1;
    case 2:
      return Class.level2;
    case 3:
      return Class.level3;
    case 4:
      return Class.level4;
    case 5:
      return Golden.level5;
  }
}
