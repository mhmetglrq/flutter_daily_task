import 'package:equatable/equatable.dart';

import 'project.dart';
import 'task.dart';

class UserEntity extends Equatable {
  final String? uid;
  final String? name;
  final String? surname;
  final String? email;
  final List<ProjectEntity>? projects;
  final String? password;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<TaskEntity>? tasks;
  final String? lastProjectId;

  const UserEntity({
    this.uid,
    this.name,
    this.surname,
    this.email,
    this.projects = const [],
    this.password,
    this.createdAt,
    this.updatedAt,
    this.tasks = const [],
    this.lastProjectId,
  });

  @override
  List<Object?> get props => [
        uid,
        name,
        surname,
        email,
        projects,
        password,
        createdAt,
        updatedAt,
        tasks,
        lastProjectId,
      ];
}
