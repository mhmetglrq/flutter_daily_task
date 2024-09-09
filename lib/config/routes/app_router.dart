// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/views/auth/sign_in.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/views/auth/sign_up.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/views/home/home.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/views/project/project_details.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/views/project/projects.dart';

import '../../features/dailyTask/presentation/views/project/create_project.dart';
import 'route_names.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.signUp:
        return _materialRoute(const SignUp());
      case RouteNames.signIn:
        return _materialRoute(const SignIn());
      case RouteNames.home:
        return _materialRoute(const Home());
      case RouteNames.projects:
        return _slideRoute(
          settings: settings,
          view: const Projects(),
          duration: const Duration(milliseconds: 300),
          //Sağdan gelecek şekilde offset ver
          begin: const Offset(1, 0),
          end: Offset.zero,
        );
      case RouteNames.createProject:
        return _fadeRoute(
          settings: settings,
          view: const CreateProject(),
          duration: const Duration(milliseconds: 300),
        );
      case RouteNames.projectDetail:
        final args = settings.arguments as Map<String, dynamic>;
        final project = args['project'];
        return _fadeRoute(
          settings: settings,
          view: ProjectDetail(
            project: project,
          ),
          duration: const Duration(milliseconds: 300),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static Route<dynamic> _slideRoute({
    required RouteSettings settings,
    required Widget view,
    Duration duration = const Duration(milliseconds: 500),
    Offset begin = const Offset(0, 1),
    Offset end = Offset.zero,
  }) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (animation, __, child) => view,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: begin,
            end: end,
          ).animate(animation),
          child: child,
        );
      },
    );
  }

  static Route<dynamic> _fadeRoute({
    required RouteSettings settings,
    required Widget view,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (animation, __, child) => view,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  static Route<dynamic> _scaleRoute({
    required RouteSettings settings,
    required Widget view,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (animation, __, child) => view,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: child,
        );
      },
    );
  }

  static Route<dynamic> _rotateRoute({
    required RouteSettings settings,
    required Widget view,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (animation, __, child) => view,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return RotationTransition(
          turns: animation,
          child: child,
        );
      },
    );
  }

  static Route<dynamic> _sizeRoute({
    required RouteSettings settings,
    required Widget view,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (animation, __, child) => view,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return Align(
          child: SizeTransition(
            sizeFactor: animation,
            child: child,
          ),
        );
      },
    );
  }
}
