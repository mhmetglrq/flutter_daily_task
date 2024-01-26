import 'package:flutter/material.dart';

import '../items/colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.scaffoldColor,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.scaffoldColor,
      elevation: 0,
      selectedItemColor: AppColors.activeColor,
      unselectedItemColor: AppColors.inactiveColor,
      type: BottomNavigationBarType.shifting,
    ),
    // datePickerTheme: const DatePickerThemeData(
    //   backgroundColor: AppColors.scaffoldColor,
    //   elevation: 5,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.all(
    //       Radius.circular(15),
    //     ),
    //   ),
    //   dayForegroundColor: MaterialStatePropertyAll(AppColors.whiteColor),
    //   yearForegroundColor: MaterialStatePropertyAll(AppColors.whiteColor),
    //   yearStyle: TextStyle(
    //     color: AppColors.whiteColor,
    //     fontWeight: FontWeight.w500,
    //     fontSize: 20,
    //     wordSpacing: 1.5,
    //     fontFamily: "Poppins",
    //   ),
    //   headerHeadlineStyle: TextStyle(
    //     color: AppColors.whiteColor,
    //     fontWeight: FontWeight.w500,
    //     fontSize: 20,
    //     wordSpacing: 1.5,
    //     fontFamily: "Poppins",
    //   ),
    //   weekdayStyle: TextStyle(
    //     color: AppColors.whiteColor,
    //     fontWeight: FontWeight.w500,
    //     fontSize: 18,
    //     wordSpacing: 1.5,
    //     fontFamily: "Poppins",
    //   ),
    //   dividerColor: AppColors.whiteColor,
    // ),
    textTheme: const TextTheme(
      displayMedium: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w600,
        fontSize: 24,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      displaySmall: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w600,
        fontSize: 20,
        fontFamily: "Poppins",
        wordSpacing: 1.5,
      ),
      displayLarge: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w600,
        fontSize: 28,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      headlineMedium: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      headlineSmall: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      headlineLarge: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w700,
        fontSize: 28,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      bodyMedium: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      bodySmall: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      bodyLarge: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      titleLarge: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      titleSmall: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      titleMedium: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      labelMedium: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      labelSmall: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
      labelLarge: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w400,
        fontSize: 18,
        wordSpacing: 1.5,
        fontFamily: "Poppins",
      ),
    ),
  );
}
