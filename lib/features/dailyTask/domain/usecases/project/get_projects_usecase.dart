import 'package:flutter_daily_task/core/usecase/usecase.dart';

import '../../../../../core/resources/data_state.dart';
import '../../entities/project.dart';
import '../../repository/project_repository.dart';

class GetProjectsUsecase implements UseCaseStream<void, List<ProjectEntity>> {
  final ProjectRepository _projectRepository;

  GetProjectsUsecase(this._projectRepository);

  @override
  Stream<DataState<List<ProjectEntity>>> call({void params}) {
    return _projectRepository.getProjects();
  }
}
