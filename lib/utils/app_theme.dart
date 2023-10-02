import 'dart:ui';

import 'package:flutter/material.dart';

import 'colors.dart';


class AppThemes {
  static const TextStyle appBarTextStyle = TextStyle(
      fontSize: 22, fontWeight: FontWeight.w700);

  static const TextStyle textDescriptionTextStyle = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w700, color: AppColor.primary);

  static const TextStyle textDescriptionDateTextStyle = TextStyle(
      fontSize: 1, fontWeight: FontWeight.w700);

  static const TextStyle bottomSheetTextStyle = TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.black);

  /// Themes
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColor.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.primary,
      titleTextStyle: appBarTextStyle.copyWith(color: AppColor.white),
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 32),
      unselectedIconTheme: IconThemeData(size: 32),
      selectedItemColor: AppColor.primary,
      unselectedItemColor: AppColor.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: AppColor.primary,
    ),
    scaffoldBackgroundColor: AppColor.accent
  );
  static ThemeData darkTheme = ThemeData(
      primaryColor: AppColor.darkPrimary,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.darkPrimary,
        titleTextStyle: appBarTextStyle.copyWith(color: AppColor.black),
        elevation: 0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(size: 32),
        unselectedIconTheme: IconThemeData(size: 32),
        selectedItemColor: AppColor.darkPrimary,
        unselectedItemColor: AppColor.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: AppColor.darkColor,
      ),
      scaffoldBackgroundColor: AppColor.darkAccent
  );

}
