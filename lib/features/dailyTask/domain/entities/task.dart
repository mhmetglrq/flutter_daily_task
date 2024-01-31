import 'package:equatable/equatable.dart';

import 'status.dart';
import 'user.dart';

class TaskEntity extends Equatable {
  final String? uid;
  final String? name;
  final String? description;
  final List<StatusEntity>? statuses;
  final List<UserEntity>? assignes;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deadline;

  const TaskEntity({
    this.uid,
    this.name,
    this.description,
    this.statuses = const [],
    this.assignes = const [],
    this.createdAt,
    this.updatedAt,
    this.deadline,
  });

  @override
  List<Object?> get props => [
        uid,
        name,
        description,
        statuses,
        assignes,
        createdAt,
        updatedAt,
        deadline,
      ];
}
