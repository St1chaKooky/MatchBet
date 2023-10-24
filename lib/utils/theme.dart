import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData buildThemeData(BuildContext context) {
  final baseTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: whiteColor, // Укажите желаемый цвет AppBar
    ),
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 38, color: whiteColor, fontWeight: FontWeight.w600),
      titleSmall: TextStyle(
          fontSize: 20, color: blackColor, fontWeight: FontWeight.w400),
      headlineSmall: TextStyle(
          fontSize: 17, color: blackColor, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(
          fontSize: 16, color: blackColor, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(
          fontSize: 10, color: textColor, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(
          fontSize: 13, color: textColor, fontWeight: FontWeight.w400),
      labelMedium: TextStyle(
          fontSize: 13, color: blackColor, fontWeight: FontWeight.w400),
      labelSmall: TextStyle(
          fontSize: 11, color: blackColor, fontWeight: FontWeight.w400),
    ),
  );

  return baseTheme.copyWith(
    textTheme: GoogleFonts.workSansTextTheme(baseTheme.textTheme),
  );
}
