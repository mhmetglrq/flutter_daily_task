import '../../domain/entities/project.dart';
import 'status.dart';
import 'task.dart';
import 'user.dart';

class ProjectModel extends ProjectEntity {
  const ProjectModel({
    super.uid,
    super.name,
    super.description,
    super.createdAt,
    super.updatedAt,
    super.deadline,
    List<TaskModel>? super.tasks,
    List<UserModel>? super.assignes,
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
      assignes: json['assignes'] != null
          ? (json['assignes'] as List)
              .map((e) => UserModel.fromJson(e))
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
      assignes: entity.assignes?.map((e) => UserModel.fromEntity(e)).toList(),
      status:
          entity.status != null ? StatusModel.fromEntity(entity.status!) : null,
      category: entity.category,
    );
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      uid: map['uid'],
      name: map['name'],
      description: map['description'],
      createdAt:
          map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      updatedAt:
          map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
      deadline:
          map['deadline'] != null ? DateTime.parse(map['deadline']) : null,
      tasks: map['tasks'] != null
          ? (map['tasks'] as List).map((e) => TaskModel.fromMap(e)).toList()
          : null,
      assignes: map['assignes'] != null
          ? (map['assignes'] as List).map((e) => UserModel.fromMap(e)).toList()
          : null,
      status: map['status'] != null ? StatusModel.fromMap(map['status']) : null,
      category: map['category'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'description': description,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deadline': deadline?.toIso8601String(),
      'tasks': tasks?.map((e) => e as Map<String, dynamic>).toList(),
      'assignes': assignes?.map((e) => e as Map<String, dynamic>).toList(),
      'category': category,
    };
  }
}
