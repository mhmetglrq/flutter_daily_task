import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/project.dart';

abstract class ProjectRepository {
  Future<DataState<void>> createProject(ProjectModel project);
}
