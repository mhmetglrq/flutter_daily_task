import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/status.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/home/get_projects_usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/home/get_status_list_usecase.dart';
part 'remote_home_event.dart';
part 'remote_home_state.dart';

class RemoteHomeBloc extends Bloc<RemoteHomeEvent, RemoteHomeState> {
  final GetProjectsUseCase _getProjectsUseCase;
  final GetStatusListUseCase _getStatusListUseCase;
  RemoteHomeBloc(this._getProjectsUseCase, this._getStatusListUseCase)
      : super(const HomeLoading()) {
    on<GetProjects>(onGetProjectsEvent);
    on<GetStatusEvent>(onGetStatusEvent);
    on<ChangeDrawerState>((
      event,
      emit,
    ) =>
        onChangeDrawerState(event, emit));
  }

  void onGetProjectsEvent(
      GetProjects event, Emitter<RemoteHomeState> emit) async {
    final dataState = await _getProjectsUseCase();
    final List<ProjectEntity>? projects = dataState.data;
    (projects ?? []).sort((a, b) => (a.createdAt ?? DateTime.now())
        .compareTo(b.createdAt ?? DateTime.now()));
    if (dataState is DataSuccess) {
      emit(HomeLoaded(projects, state.status, state.isDrawerOpen));
    } else {
      emit(
        HomeError(dataState.message),
      );
    }
  }

  void onGetStatusEvent(
      GetStatusEvent event, Emitter<RemoteHomeState> emit) async {
    final dataState = await _getStatusListUseCase();
    final List<StatusEntity> statusList = dataState.data!;
    if (dataState is DataSuccess) {
      emit(
        HomeLoaded(state.projects, statusList, state.isDrawerOpen),
      );
    } else {
      emit(HomeError(dataState.message));
    }
  }

  void onChangeDrawerState(
      ChangeDrawerState event, Emitter<RemoteHomeState> emit) {
    bool isDrawerOpen = state.isDrawerOpen ?? false;

    emit(HomeLoaded(
      state.projects,
      state.status,
      !isDrawerOpen,
    ));
  }
}
