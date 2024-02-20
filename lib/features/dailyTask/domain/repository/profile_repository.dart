import 'package:flutter_daily_task/core/resources/data_state.dart';

abstract class ProfileRepository {
  Future<DataState<void>> getProfile();
  Future<DataState<void>> getBadges();
}
