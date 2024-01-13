import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/items/colors.dart';
import 'package:flutter_daily_task/config/routes/app_route_names.dart';

import 'config/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Task',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
      ),
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      initialRoute: AppRouteNames.bottomNavbar,
    );
  }
}
