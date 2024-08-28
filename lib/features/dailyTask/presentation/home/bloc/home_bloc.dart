import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/status.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/home/get_projects_usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/home/get_status_list_usecase.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProjectsUseCase _getProjectsUseCase;
  final GetStatusListUseCase _getStatusListUseCase;
  HomeBloc(this._getProjectsUseCase, this._getStatusListUseCase)
      : super(const HomeLoading()) {
    on<GetProjects>(onGetProjectsEvent);
    on<GetStatusEvent>(onGetStatusEvent);
  }

  void onGetProjectsEvent(GetProjects event, Emitter<HomeState> emit) async {
    final dataState = await _getProjectsUseCase();
    final List<ProjectEntity>? projects = dataState.data;
    (projects ?? []).sort((a, b) => (a.createdAt ?? DateTime.now())
        .compareTo(b.createdAt ?? DateTime.now()));
    if (dataState is DataSuccess) {
      emit(HomeLoaded(projects, state.status));
    } else {
      emit(
        HomeError(dataState.message),
      );
    }
  }

  void onGetStatusEvent(GetStatusEvent event, Emitter<HomeState> emit) async {
    final dataState = await _getStatusListUseCase();
    final List<StatusEntity> statusList = dataState.data!;
    if (dataState is DataSuccess) {
      emit(
        HomeLoaded(
          state.projects,
          statusList,
        ),
      );
    } else {
      emit(HomeError(dataState.message));
    }
  }
}
