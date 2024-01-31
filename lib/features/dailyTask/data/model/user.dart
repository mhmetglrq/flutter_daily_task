import '../../domain/entities/user.dart';
import 'project.dart';
import 'task.dart';

class UserModel extends UserEntity {
  const UserModel({
    String? uid,
    String? name,
    String? surname,
    String? email,
    String? password,
    List<ProjectModel>? projects,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<TaskModel>? tasks,
  }) : super(
          uid: uid,
          name: name,
          surname: surname,
          email: email,
          password: password,
          projects: projects,
          createdAt: createdAt,
          updatedAt: updatedAt,
          tasks: tasks,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      password: json['password'],
      projects: json['projects'] != null
          ? (json['projects'] as List)
              .map((e) => ProjectModel.fromJson(e))
              .toList()
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      tasks: json['tasks'] != null
          ? (json['tasks'] as List).map((e) => TaskModel.fromJson(e)).toList()
          : null,
    );
  }

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, surname: $surname, email: $email, password: $password, projects: $projects, createdAt: $createdAt, updatedAt: $updatedAt, tasks: $tasks)';
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      uid: entity.uid,
      name: entity.name,
      surname: entity.surname,
      email: entity.email,
      password: entity.password,
      projects:
          entity.projects?.map((e) => ProjectModel.fromEntity(e)).toList(),
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      tasks: entity.tasks?.map((e) => TaskModel.fromEntity(e)).toList(),
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      surname: map['surname'],
      email: map['email'],
      password: map['password'],
      projects: map['projects'] != null
          ? (map['projects'] as List)
              .map((e) => ProjectModel.fromMap(e))
              .toList()
          : null,
      createdAt:
          map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      updatedAt:
          map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
      tasks: map['tasks'] != null
          ? (map['tasks'] as List).map((e) => TaskModel.fromMap(e)).toList()
          : null,
    );
  }
}