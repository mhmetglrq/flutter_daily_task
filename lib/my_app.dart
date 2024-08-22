import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/routes/app_route_names.dart';
import 'package:flutter_daily_task/config/routes/app_routes.dart';
import 'package:flutter_daily_task/config/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLogin, required this.isLoading});
  final bool isLogin;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Task',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      home: (!isLogin && isLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const SizedBox(),
      initialRoute: (isLogin && !isLoading)
          ? AppRouteNames.bottomNavbar
          : AppRouteNames.signIn,
    );
  }
}
