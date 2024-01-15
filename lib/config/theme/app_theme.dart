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
  );
}
