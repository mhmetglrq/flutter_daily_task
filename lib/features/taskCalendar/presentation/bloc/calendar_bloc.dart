import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'calendar_event.dart';
part 'calendar_state.dart';


class CalendarBloc extends Bloc<CalendarEvent, CalendarState>{
  CalendarBloc(super.initialState);
  
  
}