import 'package:equatable/equatable.dart';

abstract class RemoteProfileState extends Equatable {
  const RemoteProfileState();
  @override
  List<Object> get props => [];
}

class ProfileInitial extends RemoteProfileState {
  const ProfileInitial();
}

class ProfileLoading extends RemoteProfileState {
  const ProfileLoading();
}

class ProfileDone extends RemoteProfileState {
  const ProfileDone();
}
