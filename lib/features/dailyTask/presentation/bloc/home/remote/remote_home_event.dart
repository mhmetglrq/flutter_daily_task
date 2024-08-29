part of 'remote_home_bloc.dart';

abstract class RemoteHomeEvent {
  const RemoteHomeEvent();
}

class GetProjects extends RemoteHomeEvent {
  const GetProjects();
}

class GetStatusEvent extends RemoteHomeEvent {
  const GetStatusEvent();
}
