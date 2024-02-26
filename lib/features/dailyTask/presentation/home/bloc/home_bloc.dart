import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/home/get_projects_usecase.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProjectsUseCase _getProjectsUseCase;
  HomeBloc(this._getProjectsUseCase) : super(HomeLoading()) {
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
    projects.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
    if (dataState is DataSuccess) {
      emit(
        HomeLoaded(
          pageIndex,
          choosenValue,
          projects.length >= 5
              ? projects.reversed.toList().sublist(0, 5)
              : projects.reversed.toList(),
        ),
      );
    } else {
      emit(HomeError(message: dataState.message!));
    }
  }
}
