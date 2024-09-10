import '../../domain/entities/user.dart';
import 'project.dart';
import 'task.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.uid,
    super.name,
    super.surname,
    super.email,
    super.password,
    super.projects,
    super.createdAt,
    super.updatedAt,
    super.tasks,
    super.lastProjectId,
  });

  // JSON'dan UserModel'e dönüştürme
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
      lastProjectId: json['lastProjectId'],
    );
  }

  // Entity'den UserModel'e dönüştürme
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
      lastProjectId: entity.lastProjectId,
    );
  }

  // UserModel'den JSON'a dönüştürme
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'surname': surname,
      'email': email,
      'password': password,
      'projects': projects?.map((e) => ProjectModel.fromEntity(e).toJson()).toList(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'tasks': tasks?.map((e) => TaskModel.fromEntity(e).toJson()).toList(),
      'lastProjectId': lastProjectId,
    };
  }
}
