import 'package:flutter_daily_task/features/dailyTask/data/model/project.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';

abstract class ProjectEvents {
  const ProjectEvents();
}

class CreateProjectEvent extends ProjectEvents {
  final ProjectEntity project;

  CreateProjectEvent({required this.project});
}

class GetProjects extends ProjectEvents {
  final List<ProjectEntity> projects;
  const GetProjects({required this.projects});
}

class UpdateProjectEvent extends ProjectEvents {
  final ProjectEntity project;

  UpdateProjectEvent({required this.project});
}

class DeleteProjectEvent extends ProjectEvents {
  final ProjectEntity project;

  DeleteProjectEvent({required this.project});
}

class ChooseCategories extends ProjectEvents {
  final List<String> categories;

  ChooseCategories({required this.categories});
}
