import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/bloc/auth/remote/remote_auth_bloc.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/bloc/auth/remote/remote_auth_event.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/bloc/auth/remote/remote_auth_state.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/bloc/home/remote/remote_home_bloc.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/bloc/profile/remote/remote_profile_bloc.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/bloc/project/remote/project_bloc.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/bloc/task/remote/remote_task_bloc.dart';
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
        BlocProvider<RemoteHomeBloc>(
          create: (context) => sl<RemoteHomeBloc>(),
        ),
        BlocProvider<RemoteAuthBloc>(
          create: (context) => sl<RemoteAuthBloc>(),
        ),
        BlocProvider<RemoteProfileBloc>(
          create: (context) => sl<RemoteProfileBloc>(),
        ),
        BlocProvider<ProjectBloc>(
          create: (context) => sl<ProjectBloc>(),
        ),
        BlocProvider<RemoteCalendarBloc>(
          create: (context) => sl<RemoteCalendarBloc>(),
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
