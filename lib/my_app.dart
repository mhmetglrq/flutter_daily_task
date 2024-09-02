import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/config/routes/app_router.dart';
import 'package:flutter_daily_task/config/theme/app_theme.dart';

import 'features/dailyTask/presentation/bloc/auth/remote/remote_auth_bloc.dart';
import 'features/dailyTask/presentation/bloc/auth/remote/remote_auth_state.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = true;
    return BlocConsumer<RemoteAuthBloc, RemoteAuthState>(
      builder: (buildContext, state) {
        return isLoading
            ? const Material(
                child: Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.amber,
                  ),
                ),
              )
            : MaterialApp(
                title: 'Daily Task',
                theme: AppTheme.darkTheme(buildContext),
                debugShowCheckedModeBanner: false,
                onGenerateRoute: AppRouter.generateRoute,
                initialRoute: state.initialRoute,
              );
      },
      listener: (BuildContext context, RemoteAuthState state) {
        if (state is RemoteAuthDone) {
          isLoading = false;
        }
      },
    );
  }
}
