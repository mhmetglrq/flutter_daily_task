part of 'calendar_bloc.dart';

class CalendarState extends Equatable {
  final Map<String, dynamic> day;

  const CalendarState(this.day);
  @override
  List<Object?> get props => [day];

  CalendarState copyWith({Map<String, dynamic>? day}) {
    return CalendarState(day ?? this.day);
  }
}

class CalendarInitial extends CalendarState {
  CalendarInitial() : super({});
}

class CalendarLoading extends CalendarState {
  CalendarLoading() : super({});
}

class CalendarLoaded extends CalendarState {
  const CalendarLoaded(Map<String, dynamic> day) : super(day);
  @override
  List<Object?> get props => [day];
}

class CalendarError extends CalendarState {
  final String message;
  CalendarError(this.message) : super({});
  @override
  List<Object?> get props => [message];
}
