import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/status.dart';

abstract class StatusRepository {
  Future<DataState<void>> createStatus(StatusEntity status);
}
