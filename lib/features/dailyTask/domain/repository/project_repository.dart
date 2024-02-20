import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';

abstract class ProjectRepository {
  Future<DataState<void>> createProject(ProjectEntity project);
}