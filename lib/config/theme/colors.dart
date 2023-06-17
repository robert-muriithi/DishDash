
import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {

  static const Color darkGrey = Color(0xff7C7C7C);
  static const Color orange = Color(0xffEF9920);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color dark = Color(0xFF1A1A1A);
  static const Color lightGreen = Color(0xFF00E5FF);
  static const Color red = Color(0xFFE60000);

  static const ColorScheme lightColorScheme =  ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF006D3D),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF97F7B7),
    onPrimaryContainer: Color(0xFF00210F),
    secondary: Color(0xFF4F6354),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD2E8D4),
    onSecondaryContainer: Color(0xFF0D1F13),
    tertiary: Color(0xFF3B6470),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFBEEAF7),
    onTertiaryContainer: Color(0xFF001F26),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFBFDF8),
    onBackground: Color(0xFF191C1A),
    surface: Color(0xFFFBFDF8),
    onSurface: Color(0xFF191C1A),
    surfaceVariant: Color(0xFFDCE5DB),
    onSurfaceVariant: Color(0xFF414942),
    outline: Color(0xFF717971),
    //onInverseSurface: Color(0xFFF0F1EC),
    onInverseSurface: Color(0xFFFBFDF8),
    inverseSurface: Color(0xFF2E312E),
    inversePrimary: Color(0xFF7BDA9C),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006D3D),
    outlineVariant: Color(0xFFC0C9BF),
    scrim: Color(0xFF000000),
  );

  static const darkColorScheme =  ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF7BDA9C),
    onPrimary: Color(0xFF00391D),
    primaryContainer: Color(0xFF00522D),
    onPrimaryContainer: Color(0xFF97F7B7),
    secondary: Color(0xFFB6CCB9),
    onSecondary: Color(0xFF223527),
    secondaryContainer: Color(0xFF384B3D),
    onSecondaryContainer: Color(0xFFD2E8D4),
    tertiary: Color(0xFFA3CDDA),
    onTertiary: Color(0xFF023640),
    tertiaryContainer: Color(0xFF214C57),
    onTertiaryContainer: Color(0xFFBEEAF7),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF191C1A),
    onBackground: Color(0xFFE1E3DE),
    surface: Color(0xFF191C1A),
    onSurface: Color(0xFFE1E3DE),
    surfaceVariant: Color(0xFF414942),
    onSurfaceVariant: Color(0xFFC0C9BF),
    outline: Color(0xFF8B938A),
    onInverseSurface: Color(0xFF191C1A),
    inverseSurface: Color(0xFFE1E3DE),
    inversePrimary: Color(0xFF006D3D),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF7BDA9C),
    outlineVariant: Color(0xFF414942),
    scrim: Color(0xFF000000),
  );
}



