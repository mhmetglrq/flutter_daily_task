import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/task.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/repository/task_repository.dart';

import '../../../../../core/usecase/usecase.dart';

class GetTasksUseCase implements UseCase<DataState<List<TaskEntity>>, void> {
  final TaskRepository _taskRepository;

  GetTasksUseCase(this._taskRepository);

  @override
  Future<DataState<List<TaskEntity>>> call({void params}) async {
    return await _taskRepository.getTasks();
  }
}
