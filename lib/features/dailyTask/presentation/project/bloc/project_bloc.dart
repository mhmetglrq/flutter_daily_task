import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/project/create_project_usecase.dart';

import 'project_events.dart';
import 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvents, ProjectState> {
  final CreateProjectUseCase _createProjectUseCase;
  ProjectBloc(this._createProjectUseCase) : super(const ProjectLoading()) {
    on<CreateProjectEvent>(_createProjectEvent);
  }

  void _createProjectEvent(
      CreateProjectEvent event, Emitter<ProjectState> emit) async {
    final params = event.project;
    final dataState = await _createProjectUseCase(params: params);
    if (dataState is DataSuccess) {
      emit(const ProjectDone());
    } else {
      emit(ProjectError(dataState.message));
    }
  }
}
