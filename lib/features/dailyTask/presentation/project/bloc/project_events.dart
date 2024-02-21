import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';

abstract class ProjectEvents {
  const ProjectEvents();
}

class CreateProjectEvent extends ProjectEvents {
  final ProjectEntity project;

  CreateProjectEvent({required this.project});
}
