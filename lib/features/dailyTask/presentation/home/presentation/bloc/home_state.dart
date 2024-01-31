part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int pageIndex;

  const HomeState({this.pageIndex = 0});

  @override
  List<Object> get props => [pageIndex];

  HomeState copyWith({int? pageIndex}) {
    return HomeState(pageIndex: pageIndex ?? this.pageIndex);
  }
}
