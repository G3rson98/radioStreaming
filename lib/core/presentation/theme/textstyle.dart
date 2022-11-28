import 'package:flutter/material.dart';

abstract class Style {
  static const s10 = _Size(10);
  static const s12 = _Size(12);
  static const s14 = _Size(14);
  static const s16 = _Size(16);
  static const s20 = _Size(20);
  static const s22 = _Size(22);
}

abstract class CustomTextTheme{

  static TextTheme textTheme = TextTheme(
    titleLarge: Style.s22.w700,
    titleMedium: Style.s14.w300,
    bodyMedium: const TextStyle(fontWeight: FontWeight.w400,fontSize: 14),
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
