import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    primaryColor: const Color(0xFF011652),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF011652),
      onPrimary: Colors.white,
      secondary: Color(0xFFf47607),
      onSecondary: Color(0xFF060606),
      error: Colors.red,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Color(0xFF060606),
      surface: Color(0xFF025982),
      onSurface: Colors.white,
    ),
    appBarTheme: const AppBarTheme(elevation: 0),
    textTheme: GoogleFonts.robotoTextTheme(),
    scaffoldBackgroundColor: Colors.white,
  );
}
