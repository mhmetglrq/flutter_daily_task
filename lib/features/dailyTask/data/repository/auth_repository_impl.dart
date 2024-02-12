import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/user.dart';

import '../../domain/repository/auth_repository.dart';
import '../data_sources/cloud/firebase_service.dart';
import '../model/user.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseService _firebaseService;

  AuthRepositoryImpl(this._firebaseService);

  @override
  Future<DataState<void>> createUser(UserEntity user) async {
    try {
      return DataSuccess(
          data: _firebaseService.createUser(UserModel.fromEntity(user)));
    } catch (e) {
      return DataError(message: e.toString());
    }
  }

  @override
  Future<DataState<void>> signIn(String username, String password) async {
    try {
      return DataSuccess(data: _firebaseService.signIn(username, password));
    } catch (e) {
      return DataError(message: e.toString());
    }
  }

  @override
  Future<DataState<void>> signOut() async {
    try {
      return DataSuccess(data: _firebaseService.signOut());
    } catch (e) {
      return DataError(message: e.toString());
    }
  }
}
