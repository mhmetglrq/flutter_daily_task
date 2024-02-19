import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/core/usecase/usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/task.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/repository/task_repository.dart';

class CreateTaskUseCase implements UseCase<DataState<TaskModel>, TaskModel> {
  final TaskRepository _taskRepository;

  CreateTaskUseCase(this._taskRepository);

  @override
  Future<DataState<TaskModel>> call(TaskModel params) async {
    return await _taskRepository.createTask(params);
  }
}
