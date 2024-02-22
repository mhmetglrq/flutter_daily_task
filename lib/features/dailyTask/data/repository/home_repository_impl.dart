import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/data/data_sources/cloud/firebase_home_service.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final FirebaseHomeService _firebaseHomeService;
  HomeRepositoryImpl(this._firebaseHomeService);

  @override
  Future<DataState<List<ProjectEntity>>> getProjects() async {
    try {
      final projects = await _firebaseHomeService.getProjects();
      return DataSuccess(data: projects);
    } catch (e) {
      return DataError(message: e.toString());
    }
  }
}