part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int pageIndex;
  final int choosenValue;
  final List<StatusEntity> status;
  final List<ProjectEntity> projects;
  const HomeState(
      {required this.pageIndex,
      required this.choosenValue,
      required this.projects,
      required this.status});

  @override
  List<Object> get props => [pageIndex, choosenValue, projects, status];

  HomeState copyWith(
      {int? pageIndex,
      int? choosenValue,
      List<ProjectEntity>? projects,
      List<StatusEntity>? status}) {
    return HomeState(
        pageIndex: pageIndex ?? this.pageIndex,
        choosenValue: choosenValue ?? this.choosenValue,
        projects: projects ?? this.projects,
        status: status ?? this.status);
  }
}

class HomeInitial extends HomeState {
  HomeInitial()
      : super(choosenValue: 0, pageIndex: 0, projects: [], status: []);
}

class HomeLoading extends HomeState {
  HomeLoading()
      : super(choosenValue: 0, pageIndex: 0, projects: [], status: []);
}

class HomeLoaded extends HomeState {
  const HomeLoaded(int pageIndex, int choosenValue,
      List<ProjectEntity> projects, List<StatusEntity> status)
      : super(
            pageIndex: pageIndex,
            choosenValue: choosenValue,
            projects: projects,
            status: status);
}

class HomeError extends HomeState {
  final String message;
  HomeError({required this.message})
      : super(choosenValue: 0, pageIndex: 0, projects: [], status: []);

  @override
  List<Object> get props => [message];
}
