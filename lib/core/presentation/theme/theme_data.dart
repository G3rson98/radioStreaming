import 'package:flutter/material.dart';

import 'colors.dart';
import 'textstyle.dart';

class CustomThemeData{

  static final ThemeData themeData = ThemeData(
    primaryColor: CustomColors.prussianBlue,
    fontFamily: 'Ubuntu',
    textTheme: CustomTextTheme.textThemeDark,
    useMaterial3: true,
    scaffoldBackgroundColor: CustomColors.licorice,
    appBarTheme: const AppBarTheme(
      backgroundColor: CustomColors.licorice
    ),
    navigationBarTheme: const NavigationBarThemeData(
      indicatorColor: CustomColors.prussianBlue,
      backgroundColor:  CustomColors.barBrown,
        iconTheme: MaterialStatePropertyAll(
            IconThemeData(
                color: CustomColors.cornFlower,
            )
        ),
      labelTextStyle: MaterialStatePropertyAll(
          TextStyle(
              color: CustomColors.cornFlower
          )
      ),
    ),
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