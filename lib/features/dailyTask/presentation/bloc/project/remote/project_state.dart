import '../../../../domain/entities/member.dart';
import '../../../../domain/entities/project.dart';

class ProjectState {
  final String? message;
  final List<ProjectEntity>? projects;
  final String? category;
  final List<MemberEntity>? members;
  const ProjectState(
      {this.message, this.projects, this.category, this.members});
}

class ProjectInitial extends ProjectState {
  const ProjectInitial() : super();
}

class ProjectLoading extends ProjectState {
  const ProjectLoading() : super(message: "Loading...");
}

class ProjectDone extends ProjectState {
  const ProjectDone({super.projects, super.category});
}

class ProjectError extends ProjectState {
  @override
  const ProjectError(String? message) : super(message: message);
}

class CategorySelected extends ProjectState {
  const CategorySelected(String? category, {super.projects, super.members})
      : super(category: category);
}

class ProjectCreated extends ProjectState {
  const ProjectCreated() : super();
}

class ProjectCreating extends ProjectState {
  const ProjectCreating() : super(message: "Creating Project...");
}

class MembersLoading extends ProjectState {
  const MembersLoading() : super(message: "Loading Members...");
}

class MembersDone extends ProjectState {
  const MembersDone({super.members, super.projects, super.category});
}
