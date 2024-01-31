import 'package:flutter/material.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/auth/presentation/pages/sign_in.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/auth/presentation/pages/sign_up.dart';

import '../../features/dailyTask/presentation/bottomNavbar/presentation/pages/bottom_navbar.dart';
import '../../features/dailyTask/presentation/home/presentation/pages/home.dart';
import '../../features/dailyTask/presentation/taskCalendar/presentation/pages/create_task.dart';
import '../../features/dailyTask/presentation/taskCalendar/presentation/pages/task_calendar.dart';
import 'app_route_names.dart';

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
      //BottomNavbarPages
      case AppRouteNames.home:
        return _materialRoute(const Home());
      case AppRouteNames.taskCalendar:
        return _materialRoute(const TaskCalendar());
      case AppRouteNames.taskCreate:
        return _materialRoute(const CreateTask());

      default:
        return _materialRoute(const BottomNavbar());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
