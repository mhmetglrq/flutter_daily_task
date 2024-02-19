import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/data/data_sources/cloud/firebase_status_service.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/status.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/status.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/repository/status_repository.dart';

class StatusRepositoryImpl implements StatusRepository {
  final FirebaseStatusService _firebaseStatusService;

  StatusRepositoryImpl(this._firebaseStatusService);
  @override
  Future<DataState<void>> createStatus(StatusEntity status) async {
    try {
      return DataSuccess(
        data: await _firebaseStatusService.createStatus(
          StatusModel.fromEntity(status),
        ),
      );
    } catch (e) {
      return DataError(message: e.toString());
    }
  }
}
