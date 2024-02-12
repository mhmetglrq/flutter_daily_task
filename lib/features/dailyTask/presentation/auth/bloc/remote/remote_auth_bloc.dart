import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/sign_in_usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/sign_up_usecase.dart';

import 'remote_auth_event.dart';
import 'remote_auth_state.dart';

class RemoteAuthBloc extends Bloc<RemoteAuthEvent, RemoteAuthState> {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  RemoteAuthBloc(this._signInUseCase, this._signUpUseCase)
      : super(const RemoteAuthLoading()) {
    on<RemoteSignInEvent>(onSignInEvent);
  }

  void onSignInEvent(
      RemoteSignInEvent event, Emitter<RemoteAuthState> emit) async {
    Map<String, dynamic> params = {
      "username": event.username,
      "password": event.password
    };
    final dataState = await _signInUseCase(params);
    if (dataState is DataSuccess) {
      emit(const RemoteAuthSuccess());
    } else if (dataState is DataError) {
      emit(RemoteAuthError(dataState.message));
    }
  }

  void onSignUpEvent(
      RemoteSignUpEvent event, Emitter<RemoteAuthState> emit) async {
    final params = event.user;
    final dataState = await _signUpUseCase(params);
    if (dataState is DataSuccess) {
      emit(const RemoteAuthSuccess());
    } else if (dataState is DataError) {
      emit(RemoteAuthError(dataState.message));
    }
  }
}
