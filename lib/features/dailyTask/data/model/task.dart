import '../../domain/entities/task.dart';
import 'status.dart';
import 'user.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
    String? uid,
    String? name,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deadline,
    List<StatusModel>? statuses,
    List<UserModel>? assignes,
  }) : super(
          uid: uid,
          name: name,
          description: description,
          createdAt: createdAt,
          updatedAt: updatedAt,
          deadline: deadline,
          statuses: statuses,
          assignes: assignes,
        );

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
      statuses: json['statuses'] != null
          ? (json['statuses'] as List)
              .map((e) => StatusModel.fromJson(e))
              .toList()
          : null,
      assignes: json['assignes'] != null
          ? (json['assignes'] as List)
              .map((e) => UserModel.fromJson(e))
              .toList()
          : null,
    );
  }

  @override
  String toString() {
    return 'TaskModel(uid: $uid, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, deadline: $deadline, statuses: $statuses, assignes: $assignes)';
  }

  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      uid: entity.uid,
      name: entity.name,
      description: entity.description,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deadline: entity.deadline,
      statuses: entity.statuses?.map((e) => StatusModel.fromEntity(e)).toList(),
      assignes: entity.assignes?.map((e) => UserModel.fromEntity(e)).toList(),
    );
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      uid: map['uid'],
      name: map['name'],
      description: map['description'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      deadline: map['deadline'],
      statuses: map['statuses'],
      assignes: map['assignes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deadline': deadline,
      'statuses': statuses,
      'assignes': assignes,
    };
  }
}
