import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/home/get_projects_usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/project/create_project_usecase.dart';

import 'remote_project_events.dart';
import 'remote_project_state.dart';

class RemoteProjectBloc extends Bloc<RemoteProjectEvents, RemoteProjectState> {
  final CreateProjectUseCase _createProjectUseCase;
  final GetProjectsUseCase _getProjectsUseCase;
  RemoteProjectBloc(this._createProjectUseCase, this._getProjectsUseCase)
      : super(const ProjectInitial()) {
    on<CreateProjectEvent>(onCreateProjectEvent);
    on<GetProjects>(onGetProjectsEvent);
    on<ChooseCategory>(onChooseCategoryEvent);
  }

  //TODO :Find a way to get projects from state
  void onCreateProjectEvent(
      CreateProjectEvent event, Emitter<RemoteProjectState> emit) async {
    emit(const ProjectLoading());
    final params = event.project;
    final dataState = await _createProjectUseCase(params: params);
    if (dataState is DataSuccess) {
      emit(ProjectDone(category: state.category));
    } else {
      emit(
        ProjectError(dataState.message),
      );
    }
  }

  void onChooseCategoryEvent(
      ChooseCategory event, Emitter<RemoteProjectState> emit) {
    if (event.category == state.category) {
      emit(const CategorySelected(null));
    } else {
      emit(CategorySelected(event.category));
    }
  }

  void onGetProjectsEvent(
      GetProjects event, Emitter<RemoteProjectState> emit) async {
    emit(const ProjectLoading());
    final dataState = await _getProjectsUseCase();
    final List<ProjectEntity> projects = dataState.data ?? [];
    if (dataState is DataSuccess) {
      emit(ProjectDone(projects: projects, category: state.category));
    } else {
      emit(
        ProjectError(dataState.message),
      );
    }
  }
}
