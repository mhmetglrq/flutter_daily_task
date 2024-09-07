import '../../../../domain/entities/project.dart';

class ProjectState {
  final String? message;
  final List<ProjectEntity>? projects;
  final String? category;
  const ProjectState({this.message, this.projects, this.category});
}

class ProjectInitial extends ProjectState {
  const ProjectInitial() : super();
}

class ProjectLoading extends ProjectState {
  const ProjectLoading()
      : super(
          message: "Loading...",
        );
}

class ProjectDone extends ProjectState {
  const ProjectDone({super.projects, super.category});
}

class ProjectError extends ProjectState {
  @override
  const ProjectError(String? message) : super(message: message);
}

class CategorySelected extends ProjectState {
  const CategorySelected(
    String? category,
  ) : super(
          category: category,
        );
}

class ProjectCreated extends ProjectState {
  const ProjectCreated() : super();
}
