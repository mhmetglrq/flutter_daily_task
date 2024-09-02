import 'package:equatable/equatable.dart';

import '../../../../domain/entities/project.dart';

class RemoteProjectState extends Equatable {
  final String? message;
  final List<ProjectEntity> projects;
  final List<String> categories;
  const RemoteProjectState(
      {this.message, required this.projects, required this.categories});
  @override
  List<Object> get props => [message!, projects, categories];

  RemoteProjectState copyWith(
      {String? message,
      List<ProjectEntity>? projects,
      List<String>? categories}) {
    return RemoteProjectState(
        message: message ?? this.message,
        projects: projects ?? this.projects,
        categories: categories ?? this.categories);
  }
}

class ProjectInitial extends RemoteProjectState {
  ProjectInitial(List<ProjectEntity> projects)
      : super(projects: projects, message: "", categories: []);
}

class ProjectLoading extends RemoteProjectState {
  ProjectLoading(List<ProjectEntity> projects)
      : super(projects: projects, message: "", categories: []);
}

class ProjectDone extends RemoteProjectState {
  ProjectDone(List<ProjectEntity> projects, String? message)
      : super(projects: projects, message: message, categories: []);
}

class ProjectError extends RemoteProjectState {
  @override
  ProjectError(List<ProjectEntity> projects, String? message)
      : super(message: message, projects: projects, categories: []);
}
