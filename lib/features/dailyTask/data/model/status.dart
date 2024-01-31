import '../../domain/entities/status.dart';

class StatusModel extends StatusEntity {
  const StatusModel({
    String? uid,
    String? value,
  }) : super(uid: uid, value: value);

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(
      uid: json['uid'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'value': value,
    };
  }

  StatusModel copyWith({
    String? uid,
    String? value,
  }) {
    return StatusModel(
      uid: uid ?? this.uid,
      value: value ?? this.value,
    );
  }

  @override
  String toString() => 'StatusModel(uid: $uid, value: $value)';

  factory StatusModel.fromEntity(StatusEntity entity) {
    return StatusModel(
      uid: entity.uid,
      value: entity.value,
    );
  }

  factory StatusModel.fromMap(Map<String, dynamic> map) {
    return StatusModel(
      uid: map['uid'],
      value: map['value'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'value': value,
    };
  }
}
