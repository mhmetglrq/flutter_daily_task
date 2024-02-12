import 'package:equatable/equatable.dart';

abstract class RemoteAuthState extends Equatable {
  final String? message;
  const RemoteAuthState({this.message});

  @override
  List<Object> get props => [];
}

class RemoteAuthInitial extends RemoteAuthState {
  const RemoteAuthInitial();
}

class RemoteAuthLoading extends RemoteAuthState {
  const RemoteAuthLoading();
}

class RemoteAuthSuccess extends RemoteAuthState {
  const RemoteAuthSuccess();
}

class RemoteAuthError extends RemoteAuthState {
  @override
  const RemoteAuthError(message) : super(message: message);
}
