import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/core/usecase/usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/project.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/repository/project_repository.dart';

class CreateProjectUseCase implements UseCase<DataState<void>, ProjectModel> {
  final ProjectRepository _projectRepository;

  CreateProjectUseCase(this._projectRepository);

  @override
  Future<DataState<void>> call({ProjectModel? params}) async {
    return await _projectRepository.createProject(params!);
  }
}
