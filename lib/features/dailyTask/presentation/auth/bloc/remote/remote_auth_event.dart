import 'package:flutter_daily_task/features/dailyTask/domain/entities/user.dart';

abstract class RemoteAuthEvent {
  const RemoteAuthEvent();
}

class RemoteSignInEvent extends RemoteAuthEvent {
  final String username;
  final String password;

  RemoteSignInEvent({required this.username, required this.password});
}

class RemoteSignUpEvent extends RemoteAuthEvent {
  final UserEntity user;

  RemoteSignUpEvent({required this.user});
}
