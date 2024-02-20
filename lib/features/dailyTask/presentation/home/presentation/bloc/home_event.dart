part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class SetPageEvent extends HomeEvent {
  final int pageIndex;

  const SetPageEvent({required this.pageIndex});

  @override
  List<Object> get props => [pageIndex];
}

class SetChosenValueEvent extends HomeEvent {
  final int choosenValue;
  const SetChosenValueEvent({required this.choosenValue});

  @override
  List<Object> get props => [choosenValue];
}
