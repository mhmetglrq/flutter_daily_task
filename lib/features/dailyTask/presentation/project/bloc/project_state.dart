import 'package:equatable/equatable.dart';

import '../../../domain/entities/project.dart';

abstract class ProjectState extends Equatable {
  final String? message;
  final List<ProjectEntity> projects;
  const ProjectState({this.message, required this.projects});
  @override
  List<Object> get props => [message!, projects];
}

class ProjectInitial extends ProjectState {
  const ProjectInitial(List<ProjectEntity> projects)
      : super(projects: projects, message: "");
}

class ProjectLoading extends ProjectState {
  const ProjectLoading(List<ProjectEntity> projects)
      : super(projects: projects, message: "");
}

class ProjectDone extends ProjectState {
  const ProjectDone(List<ProjectEntity> projects, String? message)
      : super(projects: projects, message: message);
}

class ProjectError extends ProjectState {
  @override
  const ProjectError(List<ProjectEntity> projects, String? message)
      : super(message: message, projects: projects);
}
