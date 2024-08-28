import '../../domain/entities/status.dart';

class StatusModel extends StatusEntity {
  const StatusModel({
    super.uid,
    super.value,
    super.color,
    super.projectCount,
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(
      uid: json['uid'],
      value: json['value'],
      color: json['color'],
      projectCount: json['projectCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'value': value,
      'color': color,
      'projectCount': projectCount,
    };
  }

  StatusModel copyWith({
    String? uid,
    String? value,
    int? color,
    int? projectCount,
  }) {
    return StatusModel(
      uid: uid ?? this.uid,
      value: value ?? this.value,
    );
  }

  factory StatusModel.fromEntity(StatusEntity entity) {
    return StatusModel(
      uid: entity.uid,
      value: entity.value,
      color: entity.color,
      projectCount: entity.projectCount,
    );
  }

  factory StatusModel.fromMap(Map<String, dynamic> map) {
    return StatusModel(
      uid: map['uid'],
      value: map['value'],
      color: map['color'],
      projectCount: map['projectCount'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'value': value,
      'color': color,
      'projectCount': projectCount,
    };
  }
}
