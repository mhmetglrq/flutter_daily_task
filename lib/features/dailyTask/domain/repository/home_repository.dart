import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/status.dart';

import '../entities/project.dart';

abstract class HomeRepository {
  Future<DataState<List<ProjectEntity>>> getProjects();
  Future<DataState<List<StatusEntity>>> getStatusList();
}
