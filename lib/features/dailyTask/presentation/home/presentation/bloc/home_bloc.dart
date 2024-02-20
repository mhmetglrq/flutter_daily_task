import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<SetPageEvent>(setPageEvenet);
    on<SetChosenValueEvent>(setChosenValueEvent);
  }

  void setPageEvenet(SetPageEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(pageIndex: event.pageIndex));
  }

  void setChosenValueEvent(SetChosenValueEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(choosenValue: event.choosenValue));
  }
}
