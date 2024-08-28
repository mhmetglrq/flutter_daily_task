part of 'home_bloc.dart';

class HomeState extends Equatable {
  final String? message;
  final List<StatusEntity>? status;
  final List<ProjectEntity>? projects;
  const HomeState({this.projects, this.status, this.message});

  @override
  List<Object?> get props => [projects, status, message];
}

class HomeInitial extends HomeState {
  const HomeInitial() : super();
}

class HomeLoading extends HomeState {
  const HomeLoading() : super();
}

class HomeLoaded extends HomeState {
  const HomeLoaded(List<ProjectEntity>? projects, List<StatusEntity>? status)
      : super(projects: projects, status: status);
}

class HomeError extends HomeState {
  @override
  const HomeError(message) : super(message: message);
}
