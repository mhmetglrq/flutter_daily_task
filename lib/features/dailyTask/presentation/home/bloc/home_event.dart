part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class GetProjects extends HomeEvent {
  const GetProjects();
}

class GetStatusEvent extends HomeEvent {
  const GetStatusEvent();
}
