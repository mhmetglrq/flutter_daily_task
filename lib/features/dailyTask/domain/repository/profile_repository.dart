import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/user.dart';

abstract class ProfileRepository {
  Future<DataState<UserEntity>> getProfile();
  Future<DataState<void>> getBadges();
}
