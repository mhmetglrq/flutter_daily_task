part of 'remote_home_bloc.dart';

class RemoteHomeState extends Equatable {
  final String? message;
  final List<StatusEntity>? status;
  final List<ProjectEntity>? projects;
  const RemoteHomeState({this.projects, this.status, this.message});

  @override
  List<Object?> get props => [projects, status, message];
}

class HomeInitial extends RemoteHomeState {
  const HomeInitial() : super();
}

class HomeLoading extends RemoteHomeState {
  const HomeLoading() : super();
}

class HomeLoaded extends RemoteHomeState {
  const HomeLoaded(List<ProjectEntity>? projects, List<StatusEntity>? status)
      : super(projects: projects, status: status);
}

class HomeError extends RemoteHomeState {
  @override
  const HomeError(message) : super(message: message);
}
