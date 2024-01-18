import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/routes/app_route_names.dart';
import 'package:flutter_daily_task/features/auth/presentation/pages/sign_up.dart';

import '../../features/auth/presentation/pages/sign_in.dart';
import '../../features/bottomNavbar/presentation/pages/bottom_navbar.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const BottomNavbar());
      case AppRouteNames.bottomNavbar:
        return _materialRoute(const BottomNavbar());

      case AppRouteNames.signUp:
        return _materialRoute(const SignUp());

      case AppRouteNames.signIn:
        return _materialRoute(const SignIn());

      default:
        return _materialRoute(const BottomNavbar());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
