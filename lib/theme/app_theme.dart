import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color bg = Color(0xFF050510);
  static const Color primary = Color(0xFF6C5CE7);
  static const Color secondary = Color(0xFF00CEC9);
  static const Color accent = Color(0xFFFD79A8);
  static const Color textPrimary = Color(0xFFE0E0FF);
  static const Color textSecondary = Color(0xFF8888CC);

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: bg,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: bg,
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        headlineLarge: GoogleFonts.inter(
          fontSize: 56,
          fontWeight: FontWeight.w900,
          color: textPrimary,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: textPrimary,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: textSecondary,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: textSecondary,
        ),
      ),
    );
  }
}
