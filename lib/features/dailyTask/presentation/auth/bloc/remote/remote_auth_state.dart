import 'package:equatable/equatable.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/user.dart';

abstract class RemoteAuthState extends Equatable {
  final String? message;
  final UserEntity? user;
  const RemoteAuthState({this.message, this.user});

  @override
  List<Object> get props => [
        message!,
        user!,
      ];
}

class RemoteAuthInitial extends RemoteAuthState {
  const RemoteAuthInitial();
}

class RemoteAuthLoading extends RemoteAuthState {
  const RemoteAuthLoading();
}

class RemoteAuthDone extends RemoteAuthState {
  const RemoteAuthDone({String? message, UserEntity? userEntity})
      : super(message: message, user: userEntity);
}

class RemoteAuthError extends RemoteAuthState {
  @override
  const RemoteAuthError(message) : super(message: message);
}
