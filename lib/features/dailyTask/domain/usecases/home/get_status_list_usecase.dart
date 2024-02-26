import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/core/usecase/usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/status.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/repository/home_repository.dart';

class GetStatusListUseCase
    implements UseCase<DataState<List<StatusEntity>>, void> {
  final HomeRepository _homeRepository;
  GetStatusListUseCase(this._homeRepository);

  @override
  Future<DataState<List<StatusEntity>>> call({void params}) async {
    return await _homeRepository.getStatusList();
  }
}
