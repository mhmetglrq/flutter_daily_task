part of 'remote_task_bloc.dart';

abstract class RemoteCalendarEvent extends Equatable {
  const RemoteCalendarEvent();
}

class SetDayEvent extends RemoteCalendarEvent {
  final Map<String, dynamic> day;
  const SetDayEvent({required this.day});

  @override
  List<Object> get props => [day];
}

class CreateTaskEvent extends RemoteCalendarEvent {
  final TaskEntity task;
  const CreateTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}

class GetTasksEvent extends RemoteCalendarEvent {
  final List<TaskEntity>? tasks;
  const GetTasksEvent({this.tasks});

  @override
  List<Object> get props => [tasks!];
}
