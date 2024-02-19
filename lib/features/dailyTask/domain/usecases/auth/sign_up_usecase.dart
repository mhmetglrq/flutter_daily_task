import 'package:flutter_daily_task/features/dailyTask/domain/entities/user.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../repository/auth_repository.dart';

class SignUpUseCase implements UseCase<DataState<void>, UserEntity> {
  final AuthRepository _authRepository;

  SignUpUseCase(this._authRepository);

  @override
  Future<DataState<void>> call(params) {
    return _authRepository.createUser(params);
  }
}
