import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/config/routes/route_names.dart';
import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/auth/get_user_usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/auth/sign_in_usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/auth/sign_out_usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/auth/sign_up_usecase.dart';

import 'remote_auth_event.dart';
import 'remote_auth_state.dart';

class RemoteAuthBloc extends Bloc<RemoteAuthEvent, RemoteAuthState> {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final GetUserUseCase _getUserUseCase;
  final SignOutUseCase _signOutUseCase;
  RemoteAuthBloc(this._signInUseCase, this._signUpUseCase, this._getUserUseCase,
      this._signOutUseCase)
      : super(const RemoteAuthInitial()) {
    on<RemoteSignInEvent>(onSignInEvent);
    on<RemoteSignUpEvent>(onSignUpEvent);
    on<GetUserEvent>(onGetUserEvent);
    on<RemoteSignOutEvent>(onSignOutEvent);
  }

  void onSignInEvent(
      RemoteSignInEvent event, Emitter<RemoteAuthState> emit) async {
    final dataState = await _signInUseCase(
      params: SignInUseCaseParams(
        event.username,
        event.password,
      ),
    );
    if (dataState is DataSuccess) {
      emit(const RemoteAuthDone());
    }
    if (dataState is DataError) {
      emit(RemoteAuthError(message: dataState.message));
    }
  }

  void onGetUserEvent(GetUserEvent event, Emitter<RemoteAuthState> emit) async {
    final dataState = await _getUserUseCase();
    if (dataState is DataSuccess) {
      emit(
        RemoteAuthDone(
          userEntity: dataState.data,
          initialRoute: RouteNames.home,
        ),
      );
    } else {
      emit(RemoteAuthError(
        message: dataState.message,
      ));
    }
  }

  void onSignUpEvent(
      RemoteSignUpEvent event, Emitter<RemoteAuthState> emit) async {
    final params = SignUpCaseParams(event.user);

    final dataState = await _signUpUseCase(params: params);
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        emit(RemoteAuthDone(
          userEntity: dataState.data,
        ));
      } else {
        emit(RemoteAuthError(message: dataState.message));
      }
    }
    if (dataState is DataError) {
      emit(
        RemoteAuthError(message: dataState.message),
      );
    }
  }

  void onSignOutEvent(
      RemoteSignOutEvent event, Emitter<RemoteAuthState> emit) async {
    final dataState = await _signOutUseCase();
    if (dataState is DataSuccess) {
      emit(const RemoteAuthDone(
        userEntity: null,
      ));
    } else {
      emit(RemoteAuthError(message: dataState.message));
    }
  }

}
