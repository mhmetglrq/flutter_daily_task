import 'package:flutter_daily_task/features/dailyTask/data/data_sources/cloud/firebase_auth_service.dart';
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

  // UseCase
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));

  // Dependencies
  sl.registerLazySingleton(() => FirebaseAuthService());

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
}
