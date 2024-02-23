part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int pageIndex;
  final int choosenValue;
  final List<ProjectEntity> projects;
  const HomeState(
      {required this.pageIndex,
      required this.choosenValue,
      required this.projects});

  @override
  List<Object> get props => [pageIndex, choosenValue, projects];

  HomeState copyWith({int? pageIndex, int? choosenValue}) {
    return HomeState(
        pageIndex: pageIndex ?? this.pageIndex,
        choosenValue: choosenValue ?? this.choosenValue,
        projects: projects);
  }
}

class HomeInitial extends HomeState {
  HomeInitial() : super(choosenValue: 0, pageIndex: 0, projects: []);
}

class HomeLoading extends HomeState {
  HomeLoading() : super(choosenValue: 0, pageIndex: 0, projects: []);
}

class HomeLoaded extends HomeState {
  const HomeLoaded(
      int pageIndex, int choosenValue, List<ProjectEntity> projects)
      : super(
            pageIndex: pageIndex,
            choosenValue: choosenValue,
            projects: projects);
}

class HomeError extends HomeState {
  final String message;
  HomeError({required this.message})
      : super(choosenValue: 0, pageIndex: 0, projects: []);

  @override
  List<Object> get props => [message];
}
