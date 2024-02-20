import 'package:flutter_daily_task/features/dailyTask/domain/entities/user.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/repository/auth_repository.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/usecase/usecase.dart';

class SignUpUseCase implements UseCase<DataState<void>, UserEntity> {
  final AuthRepository _authRepository;

  SignUpUseCase(this._authRepository);

  @override
  Future<DataState<void>> call({UserEntity? params}) async {
    return await _authRepository.createUser(params!);
  }
}
