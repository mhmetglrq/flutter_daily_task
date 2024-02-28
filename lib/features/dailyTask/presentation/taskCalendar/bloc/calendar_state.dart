part of 'calendar_bloc.dart';

class CalendarState extends Equatable {
  final Map<String, dynamic>? day;
  final TaskEntity? taskEntity;
  final String? message;
  final List<TaskEntity>? tasks;
  const CalendarState({this.day, this.taskEntity, this.message, this.tasks});
  @override
  List<Object?> get props => [day, taskEntity, message];

  CalendarState copyWith({Map<String, dynamic>? day}) {
    return CalendarState(
        day: day ?? this.day, taskEntity: taskEntity, message: message);
  }
}

class CalendarInitial extends CalendarState {
  const CalendarInitial();
}

class CalendarLoading extends CalendarState {
  const CalendarLoading();
}

class CalendarLoaded extends CalendarState {
  const CalendarLoaded(
      {Map<String, dynamic>? day,
      TaskEntity? taskEntity,
      List<TaskEntity>? tasks})
      : super(day: day, taskEntity: taskEntity);
  @override
  List<Object?> get props => [day];
}

class CalendarError extends CalendarState {
  const CalendarError(String message) : super(message: message);
  @override
  List<Object?> get props => [message];
}
