import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/data/data_sources/cloud/firebase_profile_service.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/user.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final FirebaseProfileService _firebaseProfileService;

  ProfileRepositoryImpl(this._firebaseProfileService);
  @override
  Future<DataState<void>> getBadges() async {
    try {
      return DataSuccess(data: await _firebaseProfileService.getBadges());
    } catch (e) {
      return DataError(message: e.toString());
    }
  }

  @override
  Future<DataState<UserModel>> getProfile() async {
    try {
      return DataSuccess(data: await _firebaseProfileService.getProfile());
    } catch (e) {
      return DataError(message: e.toString());
    }
  }
}
