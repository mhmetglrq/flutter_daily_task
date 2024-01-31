import 'package:equatable/equatable.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/user.dart';

import 'category.dart';
import 'status.dart';
import 'task.dart';

class ProjectEntity extends Equatable {
  final String? uid;
  final String? name;
  final String? description;
  final List<CategoryEntity>? categories;
  final List<UserEntity>? assignes;
  final List<TaskEntity>? tasks;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deadline;
  final StatusEntity? status;

  const ProjectEntity({
    this.uid,
    this.name,
    this.description,
    this.categories = const [],
    this.assignes = const [],
    this.tasks = const [],
    this.createdAt,
    this.updatedAt,
    this.deadline,
    this.status = const StatusEntity(),
  });

  @override
  List<Object?> get props => [
        uid,
        name,
        description,
        categories,
        assignes,
        tasks,
        createdAt,
        updatedAt,
        deadline,
        status,
      ];
}
