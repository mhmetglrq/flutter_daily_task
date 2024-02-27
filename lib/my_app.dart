import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/config/routes/app_route_names.dart';
import 'package:flutter_daily_task/config/routes/app_routes.dart';
import 'package:flutter_daily_task/config/theme/app_theme.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/auth/bloc/remote/remote_auth_bloc.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/auth/bloc/remote/remote_auth_state.dart';

import 'features/dailyTask/presentation/auth/bloc/remote/remote_auth_event.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteAuthBloc, RemoteAuthState>(
      builder: (context, state) {
        context.read<RemoteAuthBloc>().add(GetUserEvent());
        return MaterialApp(
          title: 'Daily Task',
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          initialRoute: state.user != null
              ? AppRouteNames.bottomNavbar
              : AppRouteNames.signIn,
        );
      },
    );
  }
}
