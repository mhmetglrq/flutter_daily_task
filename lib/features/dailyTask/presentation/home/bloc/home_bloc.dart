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
      : super(HomeLoading()) {
    on<SetPageEvent>(setPageEvenet);
    on<SetChosenValueEvent>(setChosenValueEvent);
    on<GetProjects>(onGetProjectsEvent);
  }

  void setPageEvenet(SetPageEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(pageIndex: event.pageIndex));
  }

  void setChosenValueEvent(SetChosenValueEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(choosenValue: event.choosenValue));
  }

  void onGetProjectsEvent(GetProjects event, Emitter<HomeState> emit) async {
    final dataState = await _getProjectsUseCase(params: event.projects);
    final List<ProjectEntity> projects = dataState.data!;
    final int pageIndex = state.pageIndex;
    final int choosenValue = state.choosenValue;
    final StatusEntity status = state.status;
    projects.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
    if (dataState is DataSuccess) {
      emit(
        HomeLoaded(
          pageIndex,
          choosenValue,
          projects.length >= 5
              ? projects.reversed.toList().sublist(0, 5)
              : projects.reversed.toList(),
          status,
        ),
      );
    } else {
      emit(HomeError(message: dataState.message!));
    }
  }

  void onGetStatusEvent(GetStatusEvent event, Emitter<HomeState> emit) async {
    final dataState = await _getStatusListUseCase();
    final List<ProjectEntity> projects = state.projects;
    final int pageIndex = state.pageIndex;
    final int choosenValue = state.choosenValue;
    final StatusEntity status = dataState.data!.first;
    if (dataState is DataSuccess) {
      emit(
        HomeLoaded(
          pageIndex,
          choosenValue,
          projects,
          status,
        ),
      );
    } else {
      emit(HomeError(message: dataState.message!));
    }
  }
}
