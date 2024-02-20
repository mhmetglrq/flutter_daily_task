import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/core/usecase/usecase.dart';

import '../../entities/user.dart';
import '../../repository/auth_repository.dart';

class GetUserUseCase implements UseCase<DataState<UserEntity>, void> {
  final AuthRepository _authRepository;

  GetUserUseCase(this._authRepository);

  @override
  Future<DataState<UserEntity>> call({void params}) async {
    return await _authRepository.getUser();
  }
}
