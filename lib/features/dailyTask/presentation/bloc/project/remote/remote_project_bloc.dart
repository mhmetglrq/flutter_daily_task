import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/project/create_project_usecase.dart';

import '../../../../domain/usecases/project/get_projects_usecase.dart';
import 'remote_project_events.dart';
import 'remote_project_state.dart';

class RemoteProjectBloc extends Bloc<RemoteProjectEvents, RemoteProjectState> {
  final CreateProjectUseCase _createProjectUseCase;
  final GetProjectsUsecase _getProjectsUseCase;
  StreamSubscription<DataState<List<ProjectEntity>>>? _projectsSubscription;
  RemoteProjectBloc(this._createProjectUseCase, this._getProjectsUseCase)
      : super(const ProjectInitial()) {
    on<CreateProjectEvent>(onCreateProjectEvent);
    on<GetProjects>(onGetProjectsEvent);
    on<ChooseCategory>(onChooseCategoryEvent);
  }

  void onCreateProjectEvent(
      CreateProjectEvent event, Emitter<RemoteProjectState> emit) async {
    emit(const ProjectLoading());
    final params = event.project;
    final dataState = await _createProjectUseCase(params: params);
    if (dataState is DataSuccess) {
      add(const GetProjects());
      emit(const ProjectCreated());
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
    _projectsSubscription = _getProjectsUseCase().listen(
      (dataState) {
        if (dataState is DataLoading) {
          emit(const ProjectLoading());
        } else if (dataState is DataSuccess) {
          emit(ProjectDone(projects: dataState.data!));
        } else if (dataState is DataError) {
          emit(ProjectError(dataState.message!));
        }
      },
      onError: (error) {
        emit(ProjectError(error.toString()));
      },
    );
  }

  @override
  Future<void> close() {
    _projectsSubscription?.cancel();
    return super.close();
  }
}
