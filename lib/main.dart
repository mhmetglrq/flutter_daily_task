import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/config/routes/app_route_names.dart';
import 'package:flutter_daily_task/config/theme/app_theme.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/auth/bloc/remote/remote_auth_bloc.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/bottomNavbar/bloc/bottom_navbar_bloc.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/home/presentation/bloc/home_bloc.dart';

import 'config/routes/app_routes.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<RemoteAuthBloc>(
          create: (context) => sl<RemoteAuthBloc>(),
        ),
        BlocProvider<BottomNavbarBloc>(
          create: (context) => sl<BottomNavbarBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Task',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      initialRoute: AppRouteNames.signIn,
    );
  }
}
