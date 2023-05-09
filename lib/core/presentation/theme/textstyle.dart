import 'package:flutter/material.dart';

import 'colors.dart';

abstract class Style {
  static const s10 = _Size(10);
  static const s12 = _Size(12);
  static const s14 = _Size(14);
  static const s16 = _Size(16);
  static const s20 = _Size(20);
  static const s22 = _Size(22);
}

abstract class CustomTextTheme{

  static TextTheme textThemeLight = TextTheme(
    titleLarge: Style.s22.w700,
    titleMedium: Style.s14.w400,
    titleSmall: Style.s14.w500?.apply(color: CustomColors.cornFlower),
    bodyMedium: const TextStyle(fontWeight: FontWeight.w400,fontSize: 14),
  );

  static TextTheme textThemeDark = TextTheme(
    titleLarge: Style.s22.w700!.apply(color: Colors.white.withOpacity(0.7)),
    titleMedium: Style.s16.w400!.apply(color: Colors.white.withOpacity(0.7)),
    titleSmall: Style.s14.w500?.apply(color: CustomColors.cornFlower),
    bodyMedium: const TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.white),
  );
}

class _Size {
  final int size;
  const _Size(this.size);

  TextStyle? get w400 => TextStyle(
        fontSize: size.toDouble(),
        fontWeight: FontWeight.w400,
      );

  TextStyle? get w500 => TextStyle(
        fontSize: size.toDouble(),
        fontWeight: FontWeight.w500,
      );

  TextStyle? get w700 => TextStyle(
        fontSize: size.toDouble(),
        fontWeight: FontWeight.w700,
      );

  TextStyle? get w300 => TextStyle(
        fontSize: size.toDouble(),
        fontWeight: FontWeight.w300,
      );
}
