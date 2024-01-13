import 'package:flutter/material.dart';

import '../../features/bottomNavbar/presentation/pages/bottom_navbar.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const BottomNavbar());
      case '/bottom-navbar':
        return _materialRoute(const BottomNavbar());

      default:
        return _materialRoute(const BottomNavbar());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
