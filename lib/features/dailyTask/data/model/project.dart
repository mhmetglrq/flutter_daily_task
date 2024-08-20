import '../../domain/entities/project.dart';
import 'category.dart';
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
    List<CategoryModel>? super.categories,
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
      categories: json['categories'] != null
          ? (json['categories'] as List)
              .map((e) => CategoryModel.fromJson(e))
              .toList()
          : null,
    );
  }

  @override
  String toString() {
    return 'ProjectModel(uid: $uid, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, deadline: $deadline, tasks: $tasks, assignes: $assignes, status: $status, categories: $categories)';
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
      categories:
          entity.categories?.map((e) => CategoryModel.fromEntity(e)).toList(),
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
      categories: map['categories'] != null
          ? (map['categories'] as List)
              .map((e) => CategoryModel.fromMap(e))
              .toList()
          : null,
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
      'status': StatusModel.fromEntity(status!).toMap(),
      'categories':
          categories?.map((e) => CategoryModel.fromEntity(e).toMap()).toList(),
    };
  }
}
