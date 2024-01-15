import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../items/colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.scaffoldColor,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.titleTextColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.scaffoldColor,
      elevation: 0,
      selectedItemColor: AppColors.activeColor,
      unselectedItemColor: AppColors.inactiveColor,
      type: BottomNavigationBarType.shifting,
    ),
    textTheme: TextTheme(
      displayMedium: GoogleFonts.poppins(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 24,
        wordSpacing: 1.5,
      ),
      displaySmall: GoogleFonts.poppins(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
      displayLarge: GoogleFonts.poppins(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 28,
      ),
      headlineMedium: GoogleFonts.poppins(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
      headlineSmall: GoogleFonts.poppins(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      headlineLarge: GoogleFonts.poppins(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w700,
        fontSize: 28,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      bodySmall: GoogleFonts.poppins(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      bodyLarge: GoogleFonts.poppins(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
      titleLarge: GoogleFonts.poppins(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
      titleSmall: GoogleFonts.poppins(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      titleMedium: GoogleFonts.poppins(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      labelMedium: GoogleFonts.poppins(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      labelSmall: GoogleFonts.poppins(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      labelLarge: GoogleFonts.poppins(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
    ),
  );
}
