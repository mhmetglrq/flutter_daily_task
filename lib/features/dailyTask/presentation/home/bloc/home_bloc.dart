import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/home/get_projects_usecase.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProjectsUseCase _getProjectsUseCase;
  HomeBloc(this._getProjectsUseCase) : super(const HomeState()) {
    on<SetPageEvent>(setPageEvenet);
    on<SetChosenValueEvent>(setChosenValueEvent);
  }

  void setPageEvenet(SetPageEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(pageIndex: event.pageIndex));
  }

  void setChosenValueEvent(SetChosenValueEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(choosenValue: event.choosenValue));
  }

  void onGetProjectsEvent(GetProjects event, Emitter<HomeState> emit) async {
    final dataState = await _getProjectsUseCase();
    if (dataState is DataSuccess) {
      emit(HomeLoaded(dataState.data!));
    } else {
      emit(HomeError(message: dataState.message!));
    }
  }
}
