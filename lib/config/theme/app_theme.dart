import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';

import '../items/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.034),
            fontFamily: "Inter",
          ),
          displayMedium: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.03),
            fontFamily: "Inter",
          ),
          displaySmall: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.026),
            fontFamily: "Inter",
          ),
          headlineLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.034),
            fontFamily: "Inter",
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.025),
            fontFamily: "Inter",
          ),
          headlineSmall: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.026),
            fontFamily: "Inter",
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.032),
            fontFamily: "Inter",
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.025),
            fontFamily: "Inter",
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.02),
            fontFamily: "Inter",
          ),
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: context.dynamicHeight(0.024),
            fontFamily: "Inter",
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: context.dynamicHeight(0.022),
            fontFamily: "Inter",
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: context.dynamicHeight(0.02),
            fontFamily: "Inter",
          ),
          labelLarge: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.022),
            fontFamily: "Inter",
          ),
          labelMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.02),
            fontFamily: "Inter",
          ),
          labelSmall: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.017),
            fontFamily: "Inter",
          ),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.034),
            fontFamily: "Inter",
            color: AppColors.blackColor,
          ),
          displayMedium: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.03),
            fontFamily: "Inter",
            color: AppColors.blackColor,
          ),
          displaySmall: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.026),
            fontFamily: "Inter",
            color: AppColors.blackColor,
          ),
          headlineLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.034),
            fontFamily: "Inter",
            color: AppColors.blackColor,
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.025),
            fontFamily: "Inter",
            color: AppColors.blackColor,
          ),
          headlineSmall: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.026),
            fontFamily: "Inter",
            color: AppColors.blackColor,
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.032),
            fontFamily: "Inter",
            color: AppColors.blackColor,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.025),
            fontFamily: "Inter",
            color: AppColors.blackColor,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.02),
            fontFamily: "Inter",
            color: AppColors.blackColor,
          ),
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: context.dynamicHeight(0.024),
            fontFamily: "Inter",
            color: AppColors.blackColor,
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: context.dynamicHeight(0.022),
            fontFamily: "Inter",
            color: AppColors.blackColor,
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: context.dynamicHeight(0.02),
            fontFamily: "Inter",
            color: AppColors.blackColor,
          ),
          labelLarge: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.022),
            fontFamily: "Inter",
            color: AppColors.blackColor,
          ),
          labelMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.02),
            fontFamily: "Inter",
            color: AppColors.blackColor,
          ),
          labelSmall: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.017),
            fontFamily: "Inter",
            color: AppColors.blackColor,
          ),
        ),
      );
}
