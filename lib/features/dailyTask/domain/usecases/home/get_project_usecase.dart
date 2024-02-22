import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/core/usecase/usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';

import '../../repository/home_repository.dart';

class GetProjectUseCase
    implements UseCase<DataState<List<ProjectEntity>>, void> {
  final HomeRepository _homeRepository;
  GetProjectUseCase(this._homeRepository);

  @override
  Future<DataState<List<ProjectEntity>>> call({void params}) async {
    return await _homeRepository.getProjects();
  }
}
