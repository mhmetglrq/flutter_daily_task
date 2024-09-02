part of 'remote_task_bloc.dart';

class RemoteCalendarState extends Equatable {
  final Map<String, dynamic>? day;
  final TaskEntity? taskEntity;
  final String? message;
  final List<TaskEntity>? tasks;
  const RemoteCalendarState(
      {this.day, this.taskEntity, this.message, this.tasks});
  @override
  List<Object?> get props => [day, taskEntity, message];

  RemoteCalendarState copyWith({Map<String, dynamic>? day}) {
    return RemoteCalendarState(
        day: day ?? this.day, taskEntity: taskEntity, message: message);
  }
}

class CalendarInitial extends RemoteCalendarState {
  const CalendarInitial();
}

class CalendarLoading extends RemoteCalendarState {
  const CalendarLoading();
}

class CalendarLoaded extends RemoteCalendarState {
  const CalendarLoaded({super.day, super.taskEntity, super.tasks});
  @override
  List<Object?> get props => [day, taskEntity, tasks, message];
}

class CalendarError extends RemoteCalendarState {
  const CalendarError(String message) : super(message: message);
  @override
  List<Object?> get props => [message];
}
