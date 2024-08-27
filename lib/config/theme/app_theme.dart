import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';

import '../items/colors.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.whiteColor,
          selectionColor: AppColors.scaffoldColor,
          selectionHandleColor: AppColors.activeColor,
        ),
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
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.037),
            fontFamily: "Inter",
          ),
          displayMedium: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.032),
            fontFamily: "Inter",
          ),
          displaySmall: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.027),
            fontFamily: "Inter",
          ),
          headlineLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.037),
            fontFamily: "Inter",
          ),
          headlineSmall: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.027),
            fontFamily: "Inter",
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.022),
            fontFamily: "Inter",
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: context.dynamicHeight(0.037),
            fontFamily: "Inter",
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.027),
            fontFamily: "Inter",
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.022),
            fontFamily: "Inter",
          ),
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: context.dynamicHeight(0.027),
            fontFamily: "Inter",
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: context.dynamicHeight(0.022),
            fontFamily: "Inter",
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: context.dynamicHeight(0.017),
            fontFamily: "Inter",
          ),
          labelLarge: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.027),
            fontFamily: "Inter",
          ),
          labelMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.022),
            fontFamily: "Inter",
          ),
          labelSmall: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.dynamicHeight(0.017),
            fontFamily: "Inter",
          ),
        ),
        colorScheme: const ColorScheme.dark(
          onPrimary: Colors.white,
          onSurface: Colors.white,
        ),
        dialogBackgroundColor: AppColors.scaffoldColor,
        datePickerTheme: DatePickerThemeData(
          backgroundColor: AppColors.scaffoldColor,
          elevation: 5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          confirmButtonStyle: ButtonStyle(
            shape: WidgetStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
            backgroundColor: WidgetStateProperty.all(
              AppColors.containerColor,
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          headerHelpStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
            wordSpacing: 1.5,
            fontFamily: "Poppins",
          ),
          dividerColor: Colors.white,
          yearForegroundColor: WidgetStateProperty.all(Colors.white),
          yearStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
            wordSpacing: 1.5,
            fontFamily: "Poppins",
          ),
          headerForegroundColor: Colors.white,
          yearOverlayColor: const WidgetStatePropertyAll(
            Colors.white,
          ),
          weekdayStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 18,
            wordSpacing: 1.5,
            fontFamily: "Poppins",
          ),
          headerHeadlineStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
            wordSpacing: 1.5,
            fontFamily: "Poppins",
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            backgroundColor: AppColors.containerColor,
            foregroundColor: Colors.white,
          ),
        ),
      );
}
