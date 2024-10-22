import 'package:flutter_daily_task/core/resources/data_state.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../repository/auth_repository.dart';

class SignInUseCase implements UseCase<DataState<void>, SignInUseCaseParams> {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  @override
  Future<DataState<void>> call({SignInUseCaseParams? params}) async {
    return await _authRepository.signIn(
        params?.username ?? "", params?.password ?? "");
  }
}

class SignInUseCaseParams {
  final String username;
  final String password;

  SignInUseCaseParams(this.username, this.password);
}
