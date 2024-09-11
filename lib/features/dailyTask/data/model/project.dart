import 'package:flutter_daily_task/features/dailyTask/data/model/member.dart';

import '../../domain/entities/project.dart';
import 'status.dart';
import 'task.dart';

class ProjectModel extends ProjectEntity {
  const ProjectModel({
    super.uid,
    super.name,
    super.description,
    super.createdAt,
    super.updatedAt,
    super.deadline,
    List<TaskModel>? super.tasks,
    List<MemberModel>? super.assigness,
    StatusModel? super.status,
    super.category,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      uid: json['uid'],
      name: json['name'],
      description: json['description'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      deadline:
          json['deadline'] != null ? DateTime.parse(json['deadline']) : null,
      tasks: json['tasks'] != null
          ? (json['tasks'] as List).map((e) => TaskModel.fromJson(e)).toList()
          : null,
      assigness: json['assigness'] != null
          ? (json['assigness'] as List)
              .map((e) => MemberModel.fromJson(e))
              .toList()
          : null,
      status:
          json['status'] != null ? StatusModel.fromJson(json['status']) : null,
      category: json['category'],
    );
  }

  factory ProjectModel.fromEntity(ProjectEntity entity) {
    return ProjectModel(
      uid: entity.uid,
      name: entity.name,
      description: entity.description,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deadline: entity.deadline,
      tasks: entity.tasks?.map((e) => TaskModel.fromEntity(e)).toList(),
      assigness:
          entity.assigness?.map((e) => MemberModel.fromEntity(e)).toList(),
      status:
          entity.status != null ? StatusModel.fromEntity(entity.status!) : null,
      category: entity.category,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'description': description,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deadline': deadline?.toIso8601String(),
      'tasks': tasks?.map((e) => TaskModel.fromEntity(e).toJson()).toList(),
      'assigness':
          assigness?.map((e) => MemberModel.fromEntity(e).toJson()).toList(),
      'status': status != null ? StatusModel.fromEntity(status!) : null,
      'category': category,
    };
  }
}
