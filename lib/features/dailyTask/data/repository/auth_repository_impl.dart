import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/user.dart';

import '../../domain/repository/auth_repository.dart';
import '../data_sources/cloud/firebase_service.dart';
import '../model/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseService _firebaseService;

  AuthRepositoryImpl(this._firebaseService);

  @override
  Future<DataState<User>> createUser(UserEntity user) async {
    try {
      return DataSuccess(
          data: await _firebaseService.createUser(UserModel.fromEntity(user)));
    } catch (e) {
      return DataError(message: e.toString());
    }
  }

  @override
  Future<DataState<User>> signIn(String username, String password) async {
    try {
      return DataSuccess(
          data: await _firebaseService.signIn(username, password));
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
