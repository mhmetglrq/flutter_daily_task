import 'package:flutter/material.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/auth/pages/sign_in.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/auth/pages/sign_up.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/project/pages/create_project.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/project/pages/project.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/project/pages/project_details.dart';

import '../../features/dailyTask/presentation/home/pages/home.dart';
import '../../features/dailyTask/presentation/taskCalendar/pages/create_task.dart';
import '../../features/dailyTask/presentation/taskCalendar/pages/task_calendar.dart';
import 'app_route_names.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
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
      case AppRouteNames.project:
        return _materialRoute(const Project());
      case AppRouteNames.projectCreate:
        return _materialRoute(const CreateProject());
      case AppRouteNames.projectDetail:
        final args = settings.arguments as Map<String, dynamic>;
        final project = args["project"];
        return _materialRoute(ProjectDetails(project: project));

      default:
        return _materialRoute(const SignIn());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
