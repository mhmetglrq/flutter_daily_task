import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/core/usecase/usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/repository/project_repository.dart';

class CreateProjectUseCase implements UseCase<DataState<void>, ProjectEntity> {
  final ProjectRepository _projectRepository;

  CreateProjectUseCase(this._projectRepository);

  @override
  Future<DataState<void>> call({ProjectEntity? params}) async {
    return await _projectRepository.createProject(params!);
  }
}
