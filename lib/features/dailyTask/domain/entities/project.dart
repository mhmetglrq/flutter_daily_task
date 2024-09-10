import 'package:equatable/equatable.dart';
import 'member.dart';
import 'status.dart';
import 'task.dart';

class ProjectEntity extends Equatable {
  final String? uid;
  final String? name;
  final String? description;
  final String? category;
  final List<MemberEntity>? assigness;
  final List<TaskEntity>? tasks;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deadline;
  final StatusEntity? status;

  const ProjectEntity({
    this.uid,
    this.name,
    this.description,
    this.category,
    this.assigness,
    this.tasks,
    this.createdAt,
    this.updatedAt,
    this.deadline,
    this.status,
  });

  @override
  List<Object?> get props => [
        uid,
        name,
        description,
        category,
        assigness,
        tasks,
        createdAt,
        updatedAt,
        deadline,
        status,
      ];
}
