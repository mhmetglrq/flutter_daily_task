import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/project/create_project_usecase.dart';

import '../../../../domain/entities/member.dart';
import '../../../../domain/entities/project.dart';
import '../../../../domain/usecases/project/get_members_usecase.dart';
import '../../../../domain/usecases/project/get_projects_usecase.dart';
import 'project_events.dart';
import 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvents, ProjectState> {
  final CreateProjectUseCase _createProjectUseCase;
  final GetProjectsUsecase _getProjectsUseCase;
  final GetMembersUseCase _getMembersUseCase;
  ProjectBloc(this._createProjectUseCase, this._getProjectsUseCase,
      this._getMembersUseCase)
      : super(const ProjectInitial()) {
    on<CreateProjectEvent>(onCreateProjectEvent);
    on<FetchProjects>(_onFetchProjects);
    on<ChooseCategory>(onChooseCategoryEvent);
    on<FetchMember>(onFetchMemberEvent);
    on<AddMember>(onAddMemberEvent);
    on<SelectMember>(onSelectMemberEvent);
  }

  void onCreateProjectEvent(
      CreateProjectEvent event, Emitter<ProjectState> emit) async {
    emit(const ProjectCreating());
    final params = event.project;
    final dataState = await _createProjectUseCase(params: params);
    if (dataState is DataSuccess) {
      add(FetchProjects(category: state.category));
      emit(ProjectCreated(
        category: state.category,
        projects: state.projects,
      ));
    } else {
      emit(
        ProjectError(dataState.message),
      );
    }
  }

  void onChooseCategoryEvent(ChooseCategory event, Emitter<ProjectState> emit) {
    if (event.category == state.category) {
      emit(CategorySelected(
        null,
        fetchedMembers: state.fetchedMembers,
        projects: state.projects,
        members: state.members,
      ));
    } else {
      emit(CategorySelected(event.category,
          fetchedMembers: state.fetchedMembers,
          projects: state.projects,
          members: state.members));
    }
  }

  void _onFetchProjects(FetchProjects event, Emitter<ProjectState> emit) async {
    emit(const ProjectLoading());
    try {
      FetchProjectsParams params =
          FetchProjectsParams(category: event.category);
      final Stream<List<ProjectEntity>> projectStream =
          _getProjectsUseCase(params: params);

      await emit.forEach(
        projectStream,
        onData: (projects) =>
            ProjectDone(projects: projects, category: event.category),
        onError: (error, stackTrace) => ProjectError(
          error.toString(),
        ),
      );
    } catch (e) {
      emit(ProjectError(e.toString()));
    }
  }

  void onFetchMemberEvent(FetchMember event, Emitter<ProjectState> emit) async {
    emit(const MembersLoading());

    final dataState =
        await _getMembersUseCase(params: GetMembersParams(email: event.email));
    if (dataState is DataSuccess) {
      emit(MembersDone(
        fetchedMembers: dataState.data,
      ));
    } else {
      emit(
        ProjectError(dataState.message),
      );
    }
  }

  void onAddMemberEvent(AddMember event, Emitter<ProjectState> emit) {
    List<MemberEntity> members = state.members ?? [];
    members.addAll(event.members);
    emit(MembersDone(
      fetchedMembers: state.fetchedMembers,
      members: members,
      searchedMember: state.searchedMember,
      selectedMembers: state.selectedMembers,
      category: state.category,
      projects: state.projects,
    ));
  }

  void onSelectMemberEvent(SelectMember event, Emitter<ProjectState> emit) {
    List<MemberEntity> selectedMembers = state.selectedMembers ?? [];
    List<MemberEntity> members = state.members ?? [];

    if (selectedMembers.contains(event.member)) {
      selectedMembers.remove(event.member);
    } else {
      if (!members.contains(event.member)) {
        selectedMembers.add(event.member);
      }
    }
    emit(MembersDone(
      fetchedMembers: state.fetchedMembers,
      selectedMembers: selectedMembers,
      members: state.members,
      category: state.category,
      projects: state.projects,
      searchedMember: state.searchedMember,
    ));
  }
}
