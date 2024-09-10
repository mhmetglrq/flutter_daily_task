import '../../domain/entities/member.dart';

class MemberModel extends MemberEntity {
  const MemberModel({
    super.uid,
    super.name,
    super.email,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
    );
  }

  factory MemberModel.fromEntity(MemberEntity entity) {
    return MemberModel(
      uid: entity.uid,
      name: entity.name,
      email: entity.email,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
    };
  }
}
