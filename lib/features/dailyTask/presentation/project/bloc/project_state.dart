import 'package:equatable/equatable.dart';

import '../../../domain/entities/project.dart';

class ProjectState extends Equatable {
  final String? message;
  final List<ProjectEntity> projects;
  final List<String> categories;
  const ProjectState(
      {this.message, required this.projects, required this.categories});
  @override
  List<Object> get props => [message!, projects, categories];

  ProjectState copyWith(
      {String? message,
      List<ProjectEntity>? projects,
      List<String>? categories}) {
    return ProjectState(
        message: message ?? this.message,
        projects: projects ?? this.projects,
        categories: categories ?? this.categories);
  }
}

class ProjectInitial extends ProjectState {
  ProjectInitial(List<ProjectEntity> projects)
      : super(projects: projects, message: "", categories: []);
}

class ProjectLoading extends ProjectState {
  ProjectLoading(List<ProjectEntity> projects)
      : super(projects: projects, message: "", categories: []);
}

class ProjectDone extends ProjectState {
  ProjectDone(List<ProjectEntity> projects, String? message)
      : super(projects: projects, message: message, categories: []);
}

class ProjectError extends ProjectState {
  @override
  ProjectError(List<ProjectEntity> projects, String? message)
      : super(message: message, projects: projects, categories: []);
}
