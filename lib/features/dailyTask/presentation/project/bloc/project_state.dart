import 'package:equatable/equatable.dart';

abstract class ProjectState extends Equatable {
  final String? message;
  const ProjectState({this.message});
  @override
  List<Object> get props => [message!];
}

class ProjectInitial extends ProjectState {
  const ProjectInitial();
}

class ProjectLoading extends ProjectState {
  const ProjectLoading();
}

class ProjectDone extends ProjectState {
  const ProjectDone();
}

class ProjectError extends ProjectState {
  @override
  const ProjectError(message) : super(message: message);
}
