part of 'remote_home_bloc.dart';

class RemoteHomeState extends Equatable {
  final String? message;
  final List<StatusEntity>? status;
  final List<ProjectEntity>? projects;
  final bool? isDrawerOpen;
  const RemoteHomeState({
    this.projects,
    this.status,
    this.message,
    this.isDrawerOpen = false,
  });

  @override
  List<Object?> get props => [projects, status, message, isDrawerOpen];
}

class HomeInitial extends RemoteHomeState {
  const HomeInitial() : super();
}

class HomeLoading extends RemoteHomeState {
  const HomeLoading() : super();
}

class HomeLoaded extends RemoteHomeState {
  const HomeLoaded(List<ProjectEntity>? projects, List<StatusEntity>? status,
      bool? isDrawerOpen)
      : super(projects: projects, status: status, isDrawerOpen: isDrawerOpen);
}

class HomeError extends RemoteHomeState {
  @override
  const HomeError(message) : super(message: message);
}
