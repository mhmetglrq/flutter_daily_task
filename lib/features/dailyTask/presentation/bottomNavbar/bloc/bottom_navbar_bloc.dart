import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/auth/get_user_usecase.dart';
import 'bottom_navbar_event.dart';
import 'bottom_navbar_state.dart';

class BottomNavbarBloc extends Bloc<BottomNavbarEvent, BottomNavbarState> {
  final GetUserUseCase _getUserUseCase;
  BottomNavbarBloc(this._getUserUseCase) : super(const BottomNavbarLoading()) {
    on<GetUserEvent>(_getUserEvent);
    on<SetPageIndexEvent>(setIndex);
  }

  void _getUserEvent(
      GetUserEvent event, Emitter<BottomNavbarState> emit) async {
    final dataState = await _getUserUseCase();
    if (dataState is DataSuccess) {
      emit(BottomNavbarDone());
    } else if (dataState is DataError) {
      emit(
        BottomNavbarError(dataState.message),
      );
    }
  }

  void setIndex(SetPageIndexEvent event, Emitter<BottomNavbarState> emit) {
    emit(state.copyWith(index: event.pageIndex, message: event.message));
  }
}
