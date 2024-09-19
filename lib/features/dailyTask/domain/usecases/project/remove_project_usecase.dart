import 'package:flutter_daily_task/core/usecase/usecase.dart';

import '../../../../../core/resources/data_state.dart';
import '../../repository/project_repository.dart';

class RemoveProjectUsecase
    implements UseCase<DataState<void>, RemoveProjectParams> {
  final ProjectRepository _projectRepository;

  RemoveProjectUsecase(this._projectRepository);

  @override
  Future<DataState<void>> call({RemoveProjectParams? params}) {
    return _projectRepository.removeProject(params!.projectId ?? "");
  }
}

class RemoveProjectParams {
  final String? projectId;
  RemoveProjectParams({required this.projectId});
}
