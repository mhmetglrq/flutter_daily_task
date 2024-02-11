import 'package:flutter_daily_task/features/dailyTask/domain/entities/user.dart';

import '../../../../core/resources/data_state.dart';

abstract class AuthRepository {
  Future<DataState<void>> signIn(String username, String password);

  Future<void> signOut();
  Future<void> createUser(UserEntity user);
}
