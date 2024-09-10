import 'package:equatable/equatable.dart';

class MemberEntity extends Equatable {
  final String? uid;
  final String? name;
  final String? email;

  const MemberEntity({
    required this.uid,
    required this.name,
    required this.email,
  });

  @override
  List<Object?> get props => [
        uid,
        name,
        email,
      ];
}
