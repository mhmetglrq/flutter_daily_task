part of 'calendar_bloc.dart';

abstract class CalendarEvent extends Equatable {
  const CalendarEvent();
}

class SetDayEvent extends CalendarEvent {
  final Map<String, dynamic> day;
  const SetDayEvent({required this.day});

  @override
  List<Object> get props => [day];
}

class CreateTaskEvent extends CalendarEvent {
  final TaskEntity task;
  const CreateTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}
