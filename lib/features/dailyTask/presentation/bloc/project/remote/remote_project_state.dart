import '../../../../domain/entities/project.dart';

class RemoteProjectState {
  final String? message;
  final List<ProjectEntity>? projects;
  final String? category;
  const RemoteProjectState({this.message, this.projects, this.category});
}

class ProjectInitial extends RemoteProjectState {
  const ProjectInitial() : super();
}

class ProjectLoading extends RemoteProjectState {
  const ProjectLoading()
      : super(
          message: "Loading...",
        );
}

class ProjectDone extends RemoteProjectState {
  const ProjectDone({super.projects, super.category});
}

class ProjectError extends RemoteProjectState {
  @override
  const ProjectError(String? message) : super(message: message);
}

class CategorySelected extends RemoteProjectState {
  const CategorySelected(String? category)
      : super(
          category: category,
        );
}

class ProjectCreated extends RemoteProjectState {
  const ProjectCreated() : super();
}
