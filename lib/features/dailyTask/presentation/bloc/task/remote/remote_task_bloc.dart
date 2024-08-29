import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/task.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/task/create_task_usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/task/get_tasks_usecase.dart';
part 'remote_task_event.dart';
part 'remote_task_state.dart';

class RemoteCalendarBloc
    extends Bloc<RemoteCalendarEvent, RemoteCalendarState> {
  final CreateTaskUseCase _createTaskUseCase;
  final GetTasksUseCase _getTasksUseCase;
  RemoteCalendarBloc(this._createTaskUseCase, this._getTasksUseCase)
      : super(const CalendarLoading()) {
    on<SetDayEvent>(onSetDayEvent);
    on<CreateTaskEvent>(onCreateTaskEvent);
    on<GetTasksEvent>(onGetTasksEvent);
  }

  void onSetDayEvent(SetDayEvent event, Emitter<RemoteCalendarState> emit) {
    emit(state.copyWith(day: event.day));
  }

  void onCreateTaskEvent(
      CreateTaskEvent event, Emitter<RemoteCalendarState> emit) async {
    final params = event.task;
    final dataState = await _createTaskUseCase(params: params);
    if (dataState is DataSuccess) {
      emit(const CalendarLoaded());
    } else if (dataState is DataError) {
      emit(CalendarError(dataState.message!));
    }
  }

  void onGetTasksEvent(
      GetTasksEvent event, Emitter<RemoteCalendarState> emit) async {
    final dataState = await _getTasksUseCase();

    if (dataState is DataSuccess) {
      emit(CalendarLoaded(
        tasks: dataState.data!,
      ));
    } else if (dataState is DataError) {
      emit(CalendarError(dataState.message!));
    }
  }
}
