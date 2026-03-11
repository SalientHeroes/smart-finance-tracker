import 'package:flutter/material.dart';

class AppTheme {
  // ── Colours ──
  static const Color bgDark = Color(0xFF0C0D0A);
  static const Color cardDark = Color(0xFF141510);
  static const Color card2Dark = Color(0xFF1A1C16);

  static const Color primaryColor = Color(0xFF7EB89A);
  static const Color textColor = Color(0xFFE8E4DA);
  static const Color subtextColor = Color(0xFF6B6A5E);
  static const Color dangerColor = Color(0xFFC0614A);
  static const Color warnColor = Color(0xFFC9A84C);
  static const Color borderColor = Color(0xFF272820);

  static const Color creditColor = Color(0xFFC0614A);
  static const Color ewalletColor = Color(0xFF7B8FC4);
  static const Color savingsColor = Color(0xFF7EB89A);
  static const Color cashColor = Color(0xFFC9A84C);

  // ── Light mode colours ──
  static const Color bgLight = Color(0xFFF5F0E8);
  static const Color cardLight = Color(0xFFEDE8DC);
  static const Color card2Light = Color(0xFFE4DDD0);
  static const Color primaryLight = Color(0xFF2A7A6A);
  static const Color textLight = Color(0xFF1C1C18);
  static const Color subtextLight = Color(0xFF7A7468);
  static const Color borderLight = Color(0xFFD4CEC0);

  // ── Fonts ──
  static const String fontMono = 'SpaceMono';
  static const String fontSans = 'Nunito';
  static const String fontSerif = 'Scheherazade';

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: bgDark,
      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        surface: cardDark,
        error: dangerColor,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(fontFamily: fontSans, color: textColor),
        bodyMedium: TextStyle(fontFamily: fontSans, color: textColor),
        bodySmall: TextStyle(fontFamily: fontSans, color: subtextColor),
      ),
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: bgLight,
      colorScheme: ColorScheme.light(
        primary: primaryLight,
        surface: cardLight,
        error: dangerColor,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(fontFamily: fontSans, color:textLight),
        bodyMedium: TextStyle(fontFamily: fontSans, color: textLight),
        bodySmall: TextStyle(fontFamily: fontSans, color: subtextLight),
      ),
    );
  }
}