import 'package:flutter_daily_task/features/dailyTask/data/model/task.dart';

import '../../../../core/resources/data_state.dart';

abstract class TaskRepository {
  Future<DataState<TaskModel>> createTask(TaskModel task);
  
}
