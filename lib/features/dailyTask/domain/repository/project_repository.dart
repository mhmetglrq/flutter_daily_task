import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';

import '../entities/member.dart';

abstract class ProjectRepository {
  Future<DataState<void>> createProject(ProjectEntity project);
  Stream<List<ProjectEntity>> getProjects(
      {String? category, String? projectName});
  Future<DataState<List<MemberEntity>>> getMembers({String? email});
}
