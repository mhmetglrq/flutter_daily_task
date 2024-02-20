part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int pageIndex;
  final int? choosenValue;
  const HomeState({this.pageIndex = 0, this.choosenValue = 0});

  @override
  List<Object> get props => [pageIndex, choosenValue!];

  HomeState copyWith({int? pageIndex, int? choosenValue}) {
    return HomeState(
        pageIndex: pageIndex ?? this.pageIndex,
        choosenValue: choosenValue ?? this.choosenValue);
  }
}
