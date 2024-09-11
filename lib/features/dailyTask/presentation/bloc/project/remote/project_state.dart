import '../../../../domain/entities/member.dart';
import '../../../../domain/entities/project.dart';

class ProjectState {
  final String? message;
  final List<ProjectEntity>? projects;
  final String? category;
  final List<MemberEntity>? members;
  final List<MemberEntity>? fetchedMembers;
  final MemberEntity? searchedMember;
  final List<MemberEntity>? selectedMembers;
  const ProjectState(
      {this.message,
      this.projects,
      this.category,
      this.fetchedMembers,
      this.searchedMember,
      this.selectedMembers,
      this.members});
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
  const CategorySelected(String? category,
      {super.projects,
      super.fetchedMembers,
      super.members,
      super.selectedMembers,
      super.searchedMember})
      : super(category: category);
}

class ProjectCreated extends ProjectState {
  const ProjectCreated(
      {super.projects,
      super.category,
      super.fetchedMembers,
      super.members,
      super.selectedMembers,
      super.searchedMember})
      : super(message: "Project Created Successfully");
}

class ProjectCreating extends ProjectState {
  const ProjectCreating() : super(message: "Creating Project...");
}

class MembersLoading extends ProjectState {
  const MembersLoading() : super(message: "Loading Members...");
}

class MembersDone extends ProjectState {
  const MembersDone(
      {super.fetchedMembers,
      super.projects,
      super.category,
      super.members,
      super.selectedMembers,
      super.searchedMember});
}

class MemberSelected extends ProjectState {
  const MemberSelected(List<MemberEntity>? selectedMembers)
      : super(
          selectedMembers: selectedMembers,
        );
}
