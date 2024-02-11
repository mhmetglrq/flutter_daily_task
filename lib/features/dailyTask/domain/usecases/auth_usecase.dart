import 'package:flutter_daily_task/core/resources/data_state.dart';

import '../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class SignInUseCase implements UseCase<DataState<void>, Params> {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  @override
  Future<DataState<void>> call(params)async {
   return  _authRepository.signIn(params.username, params.password);
  }
}

class Params {
  final String username;
  final String password;

  Params({required this.username, required this.password});
}
