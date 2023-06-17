
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData lightThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.orange,
  secondaryHeaderColor: AppColors.lightGreen,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.white,
    selectedItemColor: AppColors.orange,
    unselectedItemColor: AppColors.darkGrey,
    elevation: 0,
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      color: AppColors.dark,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: AppColors.white,
    elevation: 0,
    iconTheme: IconThemeData(
      color: AppColors.dark,
    ),
  ),
);

ThemeData darkThemData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.orange,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.dark,
    selectedItemColor: AppColors.orange,
    unselectedItemColor: AppColors.white,
    elevation: 0,
  ),
  secondaryHeaderColor: AppColors.lightGreen,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.dark,
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      color: AppColors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: AppColors.dark,
    elevation: 0,
    iconTheme: IconThemeData(
      color: AppColors.white,
    ),
  ),
);