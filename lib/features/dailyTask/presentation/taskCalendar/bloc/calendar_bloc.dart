import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/task.dart';
part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarLoading()) {
    on<SetDayEvent>(onSetDayEvent);
  }

  void onSetDayEvent(SetDayEvent event, Emitter<CalendarState> emit) {
    emit(state.copyWith(day: event.day));
  }

  void onCreateTaskEvent()
}
