import 'package:fluffy_train/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget profilePlaceholder(double containerSize) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        height: containerSize,
        width: containerSize,
        decoration: BoxDecoration(
          color: DefaultTheme.grayscale[Grayscale.lightGray],
          shape: BoxShape.circle,
        ),
      ),
      SvgPicture.asset(
        'assets/icons/profile.svg',
        width: containerSize * 2 / 3,
        height: containerSize * 2 / 3,
        colorFilter: ColorFilter.mode(
          DefaultTheme.grayscale[Grayscale.gray]!,
          BlendMode.srcIn,
        ),
      )
    ],
  );
}
