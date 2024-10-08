import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/user.dart';

import '../../domain/repository/auth_repository.dart';
import '../data_sources/cloud/firebase_auth_service.dart';
import '../model/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService _firebaseService;

  AuthRepositoryImpl(this._firebaseService);

  @override
  Future<DataState<UserModel>> createUser(UserEntity user) async {
    try {
      return DataSuccess(
        data: await _firebaseService.createUser(
          UserModel.fromEntity(user),
        ),
      );
    } catch (e) {
      return DataError(message: e.toString());
    }
  }

  @override
  Future<DataState<User>> signIn(String username, String password) async {
    try {
      return DataSuccess(
        data: await _firebaseService.signIn(username, password),
      );
    } catch (e) {
      return DataError(message: e.toString());
    }
  }

  @override
  Future<DataState<void>> signOut() async {
    try {
      return DataSuccess(
        data: _firebaseService.signOut(),
      );
    } catch (e) {
      return DataError(message: e.toString());
    }
  }

  @override
  Future<DataState<UserEntity>> getUser() async {
    try {
      final user = await _firebaseService.getUser();

      if (user == null) {
        return DataSuccess(data: null);
      } else {
        return DataSuccess(
          data: UserModel.fromEntity(user),
        );
      }
    } catch (e) {
      return DataError(message: e.toString());
    }
  }
}
