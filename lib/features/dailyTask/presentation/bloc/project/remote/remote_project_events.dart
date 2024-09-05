import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';

abstract class RemoteProjectEvents {
  const RemoteProjectEvents();
}

class CreateProjectEvent extends RemoteProjectEvents {
  final ProjectEntity project;
  CreateProjectEvent({
    required this.project,
  });
}

class GetProjects extends RemoteProjectEvents {
  const GetProjects();
}

class UpdateProjectEvent extends RemoteProjectEvents {
  final ProjectEntity project;

  UpdateProjectEvent({required this.project});
}

class DeleteProjectEvent extends RemoteProjectEvents {
  final ProjectEntity project;

  DeleteProjectEvent({required this.project});
}

class ChooseCategory extends RemoteProjectEvents {
  final String category;
  ChooseCategory({required this.category});
}
