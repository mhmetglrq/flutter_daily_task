import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/auth/bloc/remote/remote_auth_bloc.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/auth/bloc/remote/remote_auth_event.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/auth/bloc/remote/remote_auth_state.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/bottomNavbar/bloc/bottom_navbar_bloc.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/profile/bloc/profile_bloc.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/project/bloc/project_bloc.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/taskCalendar/bloc/calendar_bloc.dart';
import 'package:flutter_daily_task/my_app.dart';
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
          create: (context) => sl<HomeBloc>(),
        ),
        BlocProvider<RemoteAuthBloc>(
          create: (context) => sl<RemoteAuthBloc>(),
        ),
        BlocProvider<BottomNavbarBloc>(
          create: (context) => sl<BottomNavbarBloc>(),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => sl<ProfileBloc>(),
        ),
        BlocProvider<ProjectBloc>(
          create: (context) => sl<ProjectBloc>(),
        ),
        BlocProvider<CalendarBloc>(
          create: (context) => sl<CalendarBloc>(),
        ),
      ],
      child: BlocBuilder<RemoteAuthBloc, RemoteAuthState>(
        builder: (context, state) {
          BlocProvider.of<RemoteAuthBloc>(context).add(GetUserEvent());
          if (state is RemoteAuthLoading) {
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else {
            return const MyApp();
          }
        },
      ),
    ),
  );
}
