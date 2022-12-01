import 'package:flutter/material.dart';

import 'colors.dart';
import 'textstyle.dart';

class CustomThemeData{

  static final ThemeData themeData = ThemeData(
    primaryColor: CustomColors.prussianBlue,
    fontFamily: 'Ubuntu',
    textTheme: CustomTextTheme.textTheme,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(
          color: CustomColors.licorice,
        ),
        elevation: 20,
        selectedItemColor: CustomColors.licorice,
        unselectedIconTheme: IconThemeData(
            color: CustomColors.skyBlue
        ),
        unselectedItemColor: CustomColors.skyBlue
    ),
  );
}