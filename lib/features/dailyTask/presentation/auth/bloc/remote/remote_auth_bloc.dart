import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/auth/sign_in_usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/auth/sign_up_usecase.dart';

import 'remote_auth_event.dart';
import 'remote_auth_state.dart';

class RemoteAuthBloc extends Bloc<RemoteAuthEvent, RemoteAuthState> {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  RemoteAuthBloc(this._signInUseCase, this._signUpUseCase)
      : super(const RemoteAuthLoading()) {
    on<RemoteSignInEvent>(onSignInEvent);
    on<RemoteSignUpEvent>(onSignUpEvent);
  }

  void onSignInEvent(
      RemoteSignInEvent event, Emitter<RemoteAuthState> emit) async {
    Map<String, dynamic> params = {
      "username": event.username,
      "password": event.password
    };
    final dataState = await _signInUseCase(params: params);
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        emit(const RemoteAuthDone());
      } else {
        emit(RemoteAuthError(dataState.message));
      }
    }
    if (dataState is DataError) {
      emit(RemoteAuthError(dataState.message));
    }
  }

  void onSignUpEvent(
      RemoteSignUpEvent event, Emitter<RemoteAuthState> emit) async {
    final params = event.user;
    final dataState = await _signUpUseCase(params: params);
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        emit(const RemoteAuthDone());
      } else {
        emit(RemoteAuthError(dataState.message));
      }
    }
    if (dataState is DataError) {
      emit(
        RemoteAuthError(dataState.message),
      );
    }
  }
}
