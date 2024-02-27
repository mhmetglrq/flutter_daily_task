import 'package:flutter_daily_task/features/dailyTask/domain/entities/task.dart';

import '../../../../core/resources/data_state.dart';

abstract class TaskRepository {
  Future<DataState<void>> createTask(TaskEntity task);
  Future<DataState<List<TaskEntity>>> getTasks();
}
