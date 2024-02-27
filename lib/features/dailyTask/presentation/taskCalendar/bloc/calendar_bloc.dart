import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/task.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/task/create_task_usecase.dart';
part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final CreateTaskUseCase _createTaskUseCase;
  CalendarBloc(this._createTaskUseCase) : super(const CalendarLoading()) {
    on<SetDayEvent>(onSetDayEvent);
  }

  void onSetDayEvent(SetDayEvent event, Emitter<CalendarState> emit) {
    emit(state.copyWith(day: event.day));
  }

  void onCreateTaskEvent(
      CreateTaskEvent event, Emitter<CalendarState> emit) async {
    final params = event.task;
    final dataState = await _createTaskUseCase(params: params);
    if (dataState is DataSuccess) {
      emit(CalendarLoaded(
        taskEntity: dataState.data!,
      ));
    } else if (dataState is DataError) {
      emit(CalendarError(dataState.message!));
    }
  }
}
