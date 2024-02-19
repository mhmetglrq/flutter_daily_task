import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/data/data_sources/cloud/firebase_project_service.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/project.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/repository/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final FirebaseProjectService _firebaseProjectService;
  ProjectRepositoryImpl(this._firebaseProjectService);

  @override
  Future<DataState<void>> createProject(ProjectEntity project) async {
    try {
      return DataSuccess(
        data: await _firebaseProjectService.createProject(
          ProjectModel.fromEntity(project),
        ),
      );
    } catch (e) {
      return DataError(message: e.toString());
    }
  }
}
