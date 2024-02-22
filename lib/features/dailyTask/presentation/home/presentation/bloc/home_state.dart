part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int pageIndex;
  final int? choosenValue;
  final List<ProjectEntity>? projects;
  const HomeState({this.pageIndex = 0, this.choosenValue = 0, this.projects});

  @override
  List<Object> get props => [pageIndex, choosenValue!, projects!];

  HomeState copyWith({int? pageIndex, int? choosenValue}) {
    return HomeState(
        pageIndex: pageIndex ?? this.pageIndex,
        choosenValue: choosenValue ?? this.choosenValue);
  }
}

class HomeInitial extends HomeState {
  const HomeInitial() : super();
}

class HomeLoading extends HomeState {
  const HomeLoading() : super();
}

class HomeLoaded extends HomeState {
  const HomeLoaded(List<ProjectEntity> projects) : super(projects: projects);
}

class HomeError extends HomeState {
  final String message;
  const HomeError({required this.message}) : super();

  @override
  List<Object> get props => [message];
}
