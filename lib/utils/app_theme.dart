import 'package:flutter/material.dart';

import 'colors.dart';

class AppThemes {
  static const TextStyle appBarTextStyle =
      TextStyle(fontSize: 22, fontWeight: FontWeight.w700);

  static const TextStyle textDescriptionTextStyle = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w700, color: AppColor.primary);

  static const TextStyle textDescriptionDateTextStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.normal);

  static const TextStyle bottomSheetTextStyle = TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.black);

  /// Themes
  static ThemeData lightTheme = ThemeData(
    dividerTheme: DividerThemeData(
      thickness: 3,
      color: AppColor.primary
    ),
    iconTheme: IconThemeData(
      color: AppColor.white,
    ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColor.white,
      ),
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
        backgroundColor: AppColor.white,
      ),
      scaffoldBackgroundColor: AppColor.accent,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        shape: StadiumBorder(side: BorderSide(color: AppColor.white, width: 3)),
      ));

  static ThemeData darkTheme = ThemeData(
      dividerTheme: DividerThemeData(
          thickness: 3,
          color: AppColor.darkPrimary
      ),
      iconTheme: IconThemeData(
        color: AppColor.darkColor,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColor.darkColor,
      ),
      primaryColor: AppColor.darkPrimary,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.darkPrimary,
        titleTextStyle: appBarTextStyle.copyWith(color: AppColor.black),
        elevation: 0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 5,
        selectedIconTheme: IconThemeData(size: 32),
        unselectedIconTheme: IconThemeData(size: 32),
        selectedItemColor: AppColor.darkPrimary,
        unselectedItemColor: AppColor.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: AppColor.darkColor,
      ),
      scaffoldBackgroundColor: AppColor.darkAccent,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        shape: StadiumBorder(side: BorderSide(color: AppColor.darkColor, width: 4)),
      ));
}
