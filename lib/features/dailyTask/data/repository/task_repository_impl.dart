import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/data/data_sources/cloud/firebase_task_service.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/task.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/task.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/repository/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final FirebaseTaskService _firebaseTaskService;

  TaskRepositoryImpl(this._firebaseTaskService);
  @override
  Future<DataState<void>> createTask(TaskEntity task) async {
    try {
      return DataSuccess(
        data: _firebaseTaskService.createTask(TaskModel.fromEntity(task)),
      );
    } catch (e) {
      return DataError(message: e.toString());
    }
  }
}
