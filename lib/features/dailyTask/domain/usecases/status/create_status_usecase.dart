import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/core/usecase/usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/status.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/repository/status_repository.dart';

class CreateStatusUseCase implements UseCase<DataState<void>, StatusEntity> {
  final StatusRepository _statusRepository;

  CreateStatusUseCase(this._statusRepository);
  @override
  Future<DataState<void>> call(StatusEntity params) async {
    return await _statusRepository.createStatus(params);
  }
}
