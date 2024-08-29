import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';

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
            color: Colors.white,
          ),
          displayMedium: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.03),
            fontFamily: "Inter",
            color: Colors.white,
          ),
          displaySmall: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.026),
            fontFamily: "Inter",
            color: Colors.white,
          ),
          headlineLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.034),
            fontFamily: "Inter",
            color: Colors.white,
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.025),
            fontFamily: "Inter",
            color: Colors.white,
          ),
          headlineSmall: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.026),
            fontFamily: "Inter",
            color: Colors.white,
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.032),
            fontFamily: "Inter",
            color: Colors.white,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.025),
            fontFamily: "Inter",
            color: Colors.white,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.02),
            fontFamily: "Inter",
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: context.dynamicHeight(0.024),
            fontFamily: "Inter",
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: context.dynamicHeight(0.022),
            fontFamily: "Inter",
            color: Colors.white,
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: context.dynamicHeight(0.02),
            fontFamily: "Inter",
            color: Colors.white,
          ),
          labelLarge: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.022),
            fontFamily: "Inter",
            color: Colors.white,
          ),
          labelMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.02),
            fontFamily: "Inter",
            color: Colors.white,
          ),
          labelSmall: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.017),
            fontFamily: "Inter",
            color: Colors.white,
          ),
        ),
      );
}
