import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Google fonts constant setting: https://fonts.google.com/
class Themes {
  static const String darkTheme = 'darkTheme';
  static const String lightTheme = 'lightTheme';

  /// Build the App Theme
  static ThemeData buildTheme(
      {required BuildContext context, String theme = Themes.darkTheme}) {
    var isDarkTheme = theme == Themes.darkTheme;

    var fontFamily = 'Rubik';
    if (isDarkTheme) {
      return buildDarkTheme(context, fontFamily);
    }
    return buildLightTheme(context, fontFamily);
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static ThemeData buildDarkTheme(BuildContext context,
      [String fontFamily = 'Rubik']) {
    return ThemeData.dark().copyWith(
      primaryColor: AppColors.primaryColor,
      appBarTheme: _darkApBarTheme,
      scaffoldBackgroundColor: AppColors.darkBackground,
      buttonTheme: _buttonTheme(context),
      elevatedButtonTheme: _elevatedButtonTheme,
      cardColor: AppColors.darkCard,
      dividerColor: AppColors.darkDivider,
      drawerTheme: const DrawerThemeData(backgroundColor: AppColors.darkCard),
      sliderTheme: _sliderTheme,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.darkBottomNavBar),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor),
      textTheme: TextTheme(
        titleLarge: TextStyle(color: AppColors.primaryColor, fontFamily: fontFamily),
        titleMedium: TextStyle(color: AppColors.primaryColor, fontFamily: fontFamily),
        titleSmall: TextStyle(color: AppColors.greyCard, fontFamily: fontFamily),
        displayLarge: TextStyle(color: AppColors.primaryColor, fontFamily: fontFamily),
        displayMedium: TextStyle(color: AppColors.primaryColor, fontFamily: fontFamily),
        displaySmall: TextStyle(color: AppColors.primaryColor, fontFamily: fontFamily),
        bodyLarge: TextStyle(color: AppColors.darkText, fontFamily: fontFamily),
        bodyMedium: TextStyle(color: AppColors.darkText, fontFamily: fontFamily),
        bodySmall: TextStyle(color: AppColors.darkText, fontFamily: fontFamily),
        labelLarge: TextStyle(
            color: Colors.white.withOpacity(0.8), fontFamily: fontFamily),
        labelMedium: TextStyle(
            color: Colors.white.withOpacity(0.8), fontFamily: fontFamily),
        labelSmall: TextStyle(
            color: Colors.white.withOpacity(0.8), fontFamily: fontFamily),
      ),
    );
  }

  static ThemeData buildLightTheme(BuildContext context,
      [String fontFamily = 'Rubik']) {
    return ThemeData.light().copyWith(
      primaryColor: AppColors.primaryColor,
      appBarTheme: _lightAppBarTheme,
      scaffoldBackgroundColor: AppColors.lightBackground,
      buttonTheme: _buttonTheme(context),
      elevatedButtonTheme: _elevatedButtonTheme,
      dividerColor: AppColors.lightDivider,
      cardColor: AppColors.lightCard,
      drawerTheme: const DrawerThemeData(backgroundColor: AppColors.lightCard),
      sliderTheme: _sliderTheme,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.lightBottomNavBar,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(color: AppColors.primaryColor, fontFamily: fontFamily),
        titleMedium: TextStyle(color: AppColors.primaryColor, fontFamily: fontFamily),
        titleSmall: TextStyle(color: AppColors.greyCard, fontFamily: fontFamily),
        displayLarge: TextStyle(color: AppColors.primaryColor, fontFamily: fontFamily),
        displayMedium: TextStyle(color: AppColors.primaryColor, fontFamily: fontFamily),
        displaySmall: TextStyle(color: AppColors.primaryColor, fontFamily: fontFamily),
        bodyLarge: TextStyle(color: AppColors.lightText, fontFamily: fontFamily),
        bodyMedium: TextStyle(color: AppColors.lightText, fontFamily: fontFamily),
        bodySmall: TextStyle(color: AppColors.lightText, fontFamily: fontFamily),
        labelLarge: TextStyle(
            color: Colors.white.withOpacity(0.8), fontFamily: fontFamily),
        labelMedium: TextStyle(
            color: Colors.white.withOpacity(0.8), fontFamily: fontFamily),
        labelSmall: TextStyle(
            color: Colors.white.withOpacity(0.8), fontFamily: fontFamily),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor),
    );
  }

  static const _darkApBarTheme = AppBarTheme(color: AppColors.primaryColor);

  static const _lightAppBarTheme = AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.greyCard),
      titleTextStyle: TextStyle(color: AppColors.greyCard),
      color: AppColors.primaryColor);
  static const _sliderTheme = SliderThemeData(
    activeTrackColor: AppColors.primaryColor,
    thumbColor: AppColors.primaryColor,
  );

  static _buttonTheme(context) => ButtonTheme.of(context).copyWith(
      buttonColor: AppColors.primaryColor, textTheme: ButtonTextTheme.primary);

  static final _elevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
      ));
}
