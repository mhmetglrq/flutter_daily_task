import '../../domain/entities/task.dart';
import 'user.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
    super.uid,
    super.name,
    super.description,
    super.createdAt,
    super.updatedAt,
    super.deadline,
    List<UserModel>? super.assignes,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      uid: json['uid'],
      name: json['name'],
      description: json['description'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      deadline:
          json['deadline'] != null ? DateTime.parse(json['deadline']) : null,
      assignes: json['assignes'] != null
          ? (json['assignes'] as List)
              .map((e) => UserModel.fromJson(e))
              .toList()
          : null,
    );
  }

  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      uid: entity.uid,
      name: entity.name,
      description: entity.description,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deadline: entity.deadline,
      assignes: entity.assignes?.map((e) => UserModel.fromEntity(e)).toList(),
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
      'assignes':
          assignes?.map((e) => UserModel.fromEntity(e).toJson()).toList(),
    };
  }
}
