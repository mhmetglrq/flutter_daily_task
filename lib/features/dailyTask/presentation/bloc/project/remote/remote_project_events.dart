import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';

abstract class RemoteProjectEvents {
  const RemoteProjectEvents();
}

class CreateProjectEvent extends RemoteProjectEvents {
  final ProjectEntity project;

  CreateProjectEvent({required this.project});
}

class GetProjects extends RemoteProjectEvents {
  final List<ProjectEntity> projects;
  const GetProjects({required this.projects});
}

class UpdateProjectEvent extends RemoteProjectEvents {
  final ProjectEntity project;

  UpdateProjectEvent({required this.project});
}

class DeleteProjectEvent extends RemoteProjectEvents {
  final ProjectEntity project;

  DeleteProjectEvent({required this.project});
}

class ChooseCategories extends RemoteProjectEvents {
  final List<String> categories;

  ChooseCategories({required this.categories});
}
