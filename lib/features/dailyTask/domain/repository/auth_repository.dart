import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/user.dart';

import '../../../../core/resources/data_state.dart';
import '../../data/model/user.dart';

abstract class AuthRepository {
  Future<DataState<User>> signIn(String username, String password);
  Future<DataState<void>> signOut();
  Future<DataState<UserEntity>> createUser(UserEntity user);
  Future<DataState<UserEntity>> getUser();
}
