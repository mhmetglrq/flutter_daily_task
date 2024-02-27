import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RemoteAuthState extends Equatable {
  final String? message;
  final User? user;
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
  const RemoteAuthDone();
}

class RemoteAuthError extends RemoteAuthState {
  @override
  const RemoteAuthError(message) : super(message: message);
}
