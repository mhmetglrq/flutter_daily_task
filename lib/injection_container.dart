import 'package:flutter_daily_task/features/dailyTask/data/data_sources/cloud/firebase_auth_service.dart';
import 'package:flutter_daily_task/features/dailyTask/data/data_sources/cloud/firebase_home_service.dart';
import 'package:flutter_daily_task/features/dailyTask/data/data_sources/cloud/firebase_project_service.dart';
import 'package:flutter_daily_task/features/dailyTask/data/data_sources/cloud/firebase_task_service.dart';
import 'package:flutter_daily_task/features/dailyTask/data/repository/home_repository_impl.dart';
import 'package:flutter_daily_task/features/dailyTask/data/repository/project_repository_impl.dart';
import 'package:flutter_daily_task/features/dailyTask/data/repository/task_repository_impl.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/repository/home_repository.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/repository/project_repository.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/repository/task_repository.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/auth/get_user_usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/home/get_projects_usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/home/get_status_list_usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/profile/get_profile_usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/project/create_project_usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/task/create_task_usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/bottomNavbar/bloc/bottom_navbar_bloc.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/profile/bloc/profile_bloc.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/project/bloc/project_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/dailyTask/data/repository/auth_repository_impl.dart';
import 'features/dailyTask/domain/repository/auth_repository.dart';
import 'features/dailyTask/domain/usecases/auth/sign_in_usecase.dart';
import 'features/dailyTask/domain/usecases/auth/sign_up_usecase.dart';
import 'features/dailyTask/presentation/auth/bloc/remote/remote_auth_bloc.dart';

final sl = GetIt.instance; // Service Locator

Future<void> initializeDependencies() async {
  // Bloc
  sl.registerFactory(() => RemoteAuthBloc(sl(), sl()));
  sl.registerFactory(() => BottomNavbarBloc(sl()));
  sl.registerFactory(() => ProfileBloc());
  sl.registerFactory(() => ProjectBloc(sl(), sl()));
  sl.registerFactory(() => HomeBloc(sl()));
  //UseCase

  //----Auth
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => GetUserUseCase(sl()));
  //----Task
  sl.registerLazySingleton(() => CreateTaskUseCase(sl()));
  //----Profile
  sl.registerLazySingleton(() => GetProfileUseCase(sl()));
  //----Project
  sl.registerLazySingleton(() => CreateProjectUseCase(sl()));
  //?----Home
  sl.registerLazySingleton(() => GetProjectsUseCase(sl()));
  sl.registerLazySingleton(() => GetStatusListUseCase(sl()));

  // Dependencies
  sl.registerLazySingleton(() => FirebaseAuthService());
  sl.registerLazySingleton(() => FirebaseTaskService());
  sl.registerLazySingleton(() => FirebaseProjectService());
  sl.registerLazySingleton(() => FirebaseHomeService());

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(sl()));
  sl.registerLazySingleton<ProjectRepository>(
      () => ProjectRepositoryImpl(sl()));
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));
}
