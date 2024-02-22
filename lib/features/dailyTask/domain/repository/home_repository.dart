import 'package:flutter_daily_task/core/resources/data_state.dart';

import '../entities/project.dart';

abstract class HomeRepository {
  Future<DataState<List<ProjectEntity>>> getProjects();
}
