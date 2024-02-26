import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/home/get_projects_usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/project/create_project_usecase.dart';

import 'project_events.dart';
import 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvents, ProjectState> {
  final CreateProjectUseCase _createProjectUseCase;
  final GetProjectsUseCase _getProjectsUseCase;
  ProjectBloc(this._createProjectUseCase, this._getProjectsUseCase)
      : super(ProjectLoading(const [])) {
    on<CreateProjectEvent>(_createProjectEvent);
    on<GetProjects>(onGetProjectsEvent);
  }

  void _createProjectEvent(
      CreateProjectEvent event, Emitter<ProjectState> emit) async {
    final params = event.project;
    final dataState = await _createProjectUseCase(params: params);
    if (dataState is DataSuccess) {
      emit(ProjectDone(
        const [],
        "",
      ));
    } else {
      emit(ProjectError(
        const [],
        dataState.message,
      ));
    }
  }

  void onGetProjectsEvent(GetProjects event, Emitter<ProjectState> emit) async {
    final dataState = await _getProjectsUseCase(params: event.projects);
    final List<ProjectEntity> projects = dataState.data!;
    if (dataState is DataSuccess) {
      emit(ProjectDone(projects, "Project Loaded Successfully!"));
    } else {
      emit(
        ProjectError(const [], dataState.message!),
      );
    }
  }

  void onChooseCategoriesEvent(
      ChooseCategories event, Emitter<ProjectState> emit) {
    emit(
      state.copyWith(categories: event.categories),
    );
  }
}
