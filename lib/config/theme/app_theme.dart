import 'package:flutter/material.dart';

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
    textTheme: const TextTheme(
      displayMedium: TextStyle(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 24,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      displaySmall: TextStyle(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 20,
        fontFamily: "Poppins",
        wordSpacing: 1.5,
      ),
      displayLarge: TextStyle(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 28,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      headlineMedium: TextStyle(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      headlineSmall: TextStyle(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      headlineLarge: TextStyle(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w700,
        fontSize: 28,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      bodyMedium: TextStyle(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      bodySmall: TextStyle(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      bodyLarge: TextStyle(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      titleLarge: TextStyle(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      titleSmall: TextStyle(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      titleMedium: TextStyle(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      labelMedium: TextStyle(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      labelSmall: TextStyle(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      labelLarge: TextStyle(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.w400,
        fontSize: 18,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
    ),
  );
}
