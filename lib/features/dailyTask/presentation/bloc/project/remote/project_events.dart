import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';

abstract class ProjectEvents {
  const ProjectEvents();
}

class CreateProjectEvent extends ProjectEvents {
  final ProjectEntity project;
  CreateProjectEvent({
    required this.project,
  });
}

class FetchProjects extends ProjectEvents {
  final String? category;
  const FetchProjects({this.category = "Software Development"});
}

class UpdateProjectEvent extends ProjectEvents {
  final ProjectEntity project;
  UpdateProjectEvent({required this.project});
}

class DeleteProjectEvent extends ProjectEvents {
  final ProjectEntity project;

  DeleteProjectEvent({required this.project});
}

class ChooseCategory extends ProjectEvents {
  final String category;
  ChooseCategory({required this.category});
}

class FetchTasks extends ProjectEvents {
  final String projectId;
  FetchTasks({required this.projectId});
}

class CreateTask extends ProjectEvents {
  final String projectId;
  final String taskName;
  CreateTask({required this.projectId, required this.taskName});
}

class FetchMembers extends ProjectEvents {
  const FetchMembers();
}
